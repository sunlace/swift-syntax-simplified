import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeDollarIdentifier(
        index: UInt
    ) -> TokenSyntax {
        SyntaxFactory.makeDollarIdentifier("$" + String(index))
    }

    static func makeSpacedBinaryOperator(
        _ text: String
    ) -> TokenSyntax {
        SyntaxFactory.makeSpacedBinaryOperator(text)
    }
}
