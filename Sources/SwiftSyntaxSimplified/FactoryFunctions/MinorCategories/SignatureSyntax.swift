import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeClosureCaptureSignature(
        items: [ClosureCaptureItemSyntax]
    ) -> ClosureCaptureSignatureSyntax {
        SyntaxFactory.makeClosureCaptureSignature(
            leftSquare: SimpleTokenSyntax.squareBracket(.left).token,
            items: makeClosureCaptureItemList(items),
            rightSquare: SimpleTokenSyntax.squareBracket(.right).token
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
            asyncKeyword: includeAsyncKeyword ? KeywordTokenSyntax.async.token : nil,
            throwsTok: includeThrowsTok ? KeywordTokenSyntax.throws.token : nil,
            output: returnType.map { makeReturnClause(returnType: $0) },
            inTok: KeywordTokenSyntax.in.token
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
            asyncKeyword: includeAsyncKeyword ? KeywordTokenSyntax.async.token : nil,
            throwsOrRethrowsKeyword: throwsOrRethrowsKeyword?.token,
            output: returnType.map { makeReturnClause(returnType: $0) }
        )
    }
}
