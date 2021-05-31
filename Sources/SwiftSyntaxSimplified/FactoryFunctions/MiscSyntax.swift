import SwiftSyntax
public extension SyntaxFactory.Simplified {

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

    static func makeTypeAnnotation(
        type: TypeSyntax
    ) -> TypeAnnotationSyntax {
        SyntaxFactory.makeTypeAnnotation(
            colon: SyntaxFactory.makeColonToken(),
            type: type
        )
    }
}
