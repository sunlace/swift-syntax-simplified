import SwiftSyntax

public extension SyntaxFactory.Simplified {
    
    static func makeDeclModifier(
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

    static func makeMultipleTrailingClosureElement(
        label: TokenSyntax,
        closure: ClosureExprSyntax
    ) -> MultipleTrailingClosureElementSyntax {
        SyntaxFactory.makeMultipleTrailingClosureElement(
            label: label,
            colon: SyntaxFactory.makeColonToken(),
            closure: closure
        )
    }

    static func makeAccessorParameter(
        name: TokenSyntax
    ) -> AccessorParameterSyntax {
        SyntaxFactory.makeAccessorParameter(
            leftParen: SyntaxFactory.makeLeftParenToken(),
            name: name,
            rightParen: SyntaxFactory.makeRightParenToken()
        )
    }
}
