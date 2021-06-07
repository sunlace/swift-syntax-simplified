import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeConformanceRequirement(
        leftTypeIdentifier: TypeSyntax,
        rightTypeIdentifier: TypeSyntax
    ) -> ConformanceRequirementSyntax {
        SyntaxFactory.makeConformanceRequirement(
            leftTypeIdentifier: leftTypeIdentifier,
            colon: SimpleTokenSyntax.colon.token,
            rightTypeIdentifier: rightTypeIdentifier
        )
    }

    static func makeSameTypeRequirement(
        leftTypeIdentifier: TypeSyntax,
        rightTypeIdentifier: TypeSyntax
    ) -> SameTypeRequirementSyntax {
        SyntaxFactory.makeSameTypeRequirement(
            leftTypeIdentifier: leftTypeIdentifier,
            equalityToken: makeSpacedBinaryOperator("=="),
            rightTypeIdentifier: rightTypeIdentifier
        )
    }
}
