import SwiftSyntax

extension SyntaxFactory.Simplified {
    
    public static func makeDeclModifier(
        name: TokenSyntax,
        detail: TokenSyntax? = nil
    ) -> DeclModifierSyntax {
        SyntaxFactory.makeDeclModifier(
            name: name,
            detailLeftParen: detail.map { _ in SyntaxFactory.makeLeftParenToken() },
            detail: detail,
            detailRightParen: detail.map { _ in SyntaxFactory.makeRightParenToken() }
        )
    }

    public static func makeMultipleTrailingClosureElement(
        label: TokenSyntax,
        closure: ClosureExprSyntax
    ) -> MultipleTrailingClosureElementSyntax {
        SyntaxFactory.makeMultipleTrailingClosureElement(
            label: label,
            colon: SyntaxFactory.makeColonToken(),
            closure: closure
        )
    }

    public static func makeCodeBlock(
        statements: [CodeBlockItemSyntax] = []
    ) -> CodeBlockSyntax {
        SyntaxFactory.makeCodeBlock(
            leftBrace: SyntaxFactory.makeLeftBraceToken(),
            statements: SyntaxFactory.makeCodeBlockItemList(statements),
            rightBrace: SyntaxFactory.makeRightBraceToken()
        )
    }

    public static func makeAccessorBlock(
        leftBrace: TokenSyntax,
        accessors: [AccessorDeclSyntax],
        rightBrace: TokenSyntax
    ) -> AccessorBlockSyntax {
        SyntaxFactory.makeAccessorBlock(
            leftBrace: SyntaxFactory.makeLeftBraceToken(),
            accessors: SyntaxFactory.makeAccessorList(accessors),
            rightBrace: SyntaxFactory.makeRightBraceToken()
        )
    }

    public static func makeAccessorParameter(
        name: TokenSyntax
    ) -> AccessorParameterSyntax {
        SyntaxFactory.makeAccessorParameter(
            leftParen: SyntaxFactory.makeLeftParenToken(),
            name: name,
            rightParen: SyntaxFactory.makeRightParenToken()
        )
    }
}
