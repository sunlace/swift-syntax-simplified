import SwiftSyntax

extension StringSegmentSyntax {

public extension SyntaxFactory.Simplified {

    static func makeStringSegment(
        content: TokenSyntax
    ) -> StringSegmentSyntax {
        SyntaxFactory.makeStringSegment(
            content: content
        )
    }
}
