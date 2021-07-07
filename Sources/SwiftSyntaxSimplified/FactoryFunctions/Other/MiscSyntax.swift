import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeMultipleTrailingClosureElement(
        label: TokenSyntax,
        closure: ClosureExprSyntax
    ) -> MultipleTrailingClosureElementSyntax {
        SyntaxFactory.makeMultipleTrailingClosureElement(
            label: label,
            colon: SimpleTokenSyntax.colon.token,
            closure: closure
        )
    }

    static func makeAccessorParameter(
        name: TokenSyntax
    ) -> AccessorParameterSyntax {
        SyntaxFactory.makeAccessorParameter(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            name: name,
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }

    static func makeDeclNameArguments(
        argumentNames: [TokenSyntax]
    ) -> DeclNameArgumentsSyntax {
        SyntaxFactory.makeDeclNameArguments(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            arguments: makeDeclNameArgumentList(argumentNames),
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }

    static func makeTypeAnnotation(
        type: TypeSyntax
    ) -> TypeAnnotationSyntax {
        SyntaxFactory.makeTypeAnnotation(
            colon: SimpleTokenSyntax.colon.token,
            type: type
        )
    }

    static func makeSourceFile(
        statements: [Syntax] = []
    ) -> SourceFileSyntax {
        SyntaxFactory.makeSourceFile(
            statements: makeCodeBlockItemList(statements),
            eofToken: SimpleTokenSyntax.eof.token
        )
    }

    static func makeAttribute(
        attributeName: TokenSyntax,
        argument: Syntax? = nil,
        tokenList: TokenListSyntax? = nil // TODO: What is this for?
    ) -> AttributeSyntax {
        SyntaxFactory.makeAttribute(
            atSignToken: SimpleTokenSyntax.atSign.token,
            attributeName: attributeName,
            leftParen: argument.map { _ in SimpleTokenSyntax.paren(.left).token },
            argument: argument,
            rightParen: argument.map { _ in SimpleTokenSyntax.paren(.right).token },
            tokenList: tokenList
        )
    }

    static func makeStringSegment(
        content: TokenSyntax
    ) -> StringSegmentSyntax {
        SyntaxFactory.makeStringSegment(
            content: content
        )
    }

    static func makeSwitchCase(
        includeUnknownAttr: Bool = false,
        label: LabelSyntaxProtocol,
        statements: [Syntax]
    ) -> SwitchCaseSyntax {
        SyntaxFactory.makeSwitchCase(
            unknownAttr: includeUnknownAttr ? makeAttribute(
                attributeName: SyntaxFactory.makeIdentifier("unknown")
            ) : nil,
            label: label.typeErased,
            statements: makeCodeBlockItemList(statements)
        )
    }
}
