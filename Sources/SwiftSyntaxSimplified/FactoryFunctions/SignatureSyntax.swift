import SwiftSyntax

public protocol ClosureSignatureInputSyntaxProtocol: SyntaxProtocol {}

extension ParameterClauseSyntax: ClosureSignatureInputSyntaxProtocol {}
extension ClosureParamListSyntax: ClosureSignatureInputSyntaxProtocol {}

public extension SyntaxFactory.Simplified {

    static func makeClosureCaptureSignature(
        items: [ClosureCaptureItemSyntax]
    ) -> ClosureCaptureSignatureSyntax {
        SyntaxFactory.makeClosureCaptureSignature(
            leftSquare: SyntaxFactory.makeLeftSquareBracketToken(),
            items: makeClosureCaptureItemList(items),
            rightSquare: SyntaxFactory.makeRightSquareBracketToken()
        )
    }

    static func makeClosureSignature(
        captureItems: [ClosureCaptureItemSyntax] = [],
        input: ClosureSignatureInputSyntaxProtocol? = nil,
        includeAsyncKeyword: Bool = false,
        includeThrowsTok: Bool = false,
        returnType: TypeSyntax? = nil
    ) -> ClosureSignatureSyntax {
        SyntaxFactory.makeClosureSignature(
            capture: captureItems.onlyIfNotEmpty.map {
                makeClosureCaptureSignature(items: $0)
            },
            input: input.map { $0.typeErased },
            asyncKeyword: includeAsyncKeyword ? SyntaxFactory.makeIdentifier("async") : nil,
            throwsTok: SyntaxFactory.makeThrowsKeyword(),
            output: returnType.map { makeReturnClause(returnType: $0) },
            inTok: SyntaxFactory.makeInKeyword()
        )
    }

    static func makeFunctionSignature(
        parameters: [FunctionParameterSyntax] = [],
        includeAsyncKeyword: Bool = false,
        throwsOrRethrowsKeyword: ThrowsOrRethrowsKeywordTokenSyntax? = nil,
        returnType: TypeSyntax? = nil
    ) -> FunctionSignatureSyntax {
        SyntaxFactory.makeFunctionSignature(
            input: makeParameterClause(parameters: parameters),
            asyncKeyword: includeAsyncKeyword ? SyntaxFactory.makeIdentifier("async") : nil,
            throwsOrRethrowsKeyword: throwsOrRethrowsKeyword?.token,
            output: returnType.map { makeReturnClause(returnType: $0) }
        )
    }
}
