import SwiftSyntax

extension SyntaxFactory.Simplified {

    static func makeConformanceRequirement(
        leftTypeIdentifier: TypeSyntax,
        rightTypeIdentifier: TypeSyntax
    ) -> ConformanceRequirementSyntax {
        SyntaxFactory.makeConformanceRequirement(
            leftTypeIdentifier: leftTypeIdentifier,
            colon: SyntaxFactory.makeColonToken(),
            rightTypeIdentifier: rightTypeIdentifier
        )
    }

    static func makeSameTypeRequirement(
        leftTypeIdentifier: TypeSyntax,
        rightTypeIdentifier: TypeSyntax
    ) -> SameTypeRequirementSyntax {
        SyntaxFactory.makeSameTypeRequirement(
            leftTypeIdentifier: leftTypeIdentifier,
            equalityToken: SyntaxFactory.makeSpacedBinaryOperator("=="),
            rightTypeIdentifier: rightTypeIdentifier
        )
    }
}
