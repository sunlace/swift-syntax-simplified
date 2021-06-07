import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeAccessPath(
        _ componentNames: [TokenSyntax]
    ) -> AccessPathSyntax {
        SyntaxFactory.makeAccessPath(componentNames.mapWithIsLast {
            SyntaxFactory.makeAccessPathComponent(
                name: $0.element,
                trailingDot: $0.isLast ? nil : SimpleTokenSyntax.period.token
            )
        })
    }
}
