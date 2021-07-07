import SwiftSyntax

public extension SyntaxFactory.Simplified {

    // Semantically, array, dictionary, and closure exprs should be included here as well

    static func makeBooleanLiteralExpr(
        booleanLiteral: Bool
    ) -> BooleanLiteralExprSyntax {
        SyntaxFactory.makeBooleanLiteralExpr(
            booleanLiteral: booleanLiteral
                ? KeywordTokenSyntax.true.token
                : KeywordTokenSyntax.false.token
        )
    }

    static func makeNilLiteralExpr() -> NilLiteralExprSyntax {
        SyntaxFactory.makeNilLiteralExpr(
            nilKeyword: KeywordTokenSyntax.nil.token
        )
    }

    static func makeStringLiteralExpr(
        delimiterCount: Int = 0,
        quote: SimpleTokenSyntax.Quote = .string,
        segments: [StringSegmentSyntaxProtocol] = []
    ) -> StringLiteralExprSyntax {
        let delimiterArray = Array(repeating: "#", count: delimiterCount)
        let delimiterToken = delimiterArray.onlyIfNotEmpty.map {
            SyntaxFactory.makeIdentifier($0.joined())
        }

        let segments = SyntaxFactory.makeStringLiteralSegments(segments.map { $0.make(delimiter: delimiterToken).typeErased
        })

        return SyntaxFactory.makeStringLiteralExpr(
            openDelimiter: delimiterToken,
            openQuote: SimpleTokenSyntax.quote(quote).token,
            segments: segments,
            closeQuote: SimpleTokenSyntax.quote(quote).token,
            closeDelimiter: delimiterToken
        )
    }
}
