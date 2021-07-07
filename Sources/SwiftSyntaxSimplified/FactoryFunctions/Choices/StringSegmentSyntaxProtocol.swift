import SwiftSyntax

public protocol StringSegmentSyntaxProtocol: SyntaxProtocol {
    func make(delimiter: TokenSyntax?) -> Syntax
}

extension TupleExprElementListSyntax: StringSegmentSyntaxProtocol {

    public func make(delimiter: TokenSyntax?) -> Syntax {
        SyntaxFactory.makeExpressionSegment(
            backslash: SimpleTokenSyntax.backslash.token,
            delimiter: delimiter,
            leftParen: SimpleTokenSyntax.paren(.left).token,
            expressions: self,
            rightParen: SimpleTokenSyntax.paren(.right).token
        ).typeErased
    }
}

extension TokenSyntax: StringSegmentSyntaxProtocol {

    public func make(delimiter: TokenSyntax?) -> Syntax {
        SyntaxFactory.Simplified.makeStringSegment(content: self).typeErased
    }
}
