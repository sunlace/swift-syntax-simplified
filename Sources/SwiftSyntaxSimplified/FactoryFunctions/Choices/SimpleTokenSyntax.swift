import SwiftSyntax

enum SimpleTokenSyntax {

    enum Side {
        case left
        case right
    }

    enum Placement {
        case infix
        case postfix
    }

    case angle(Side)
    case brace(Side)
    case paren(Side)
    case squareBracket(Side)

    case comma
    case period
    case ellipsis
    case exclamationMark
    case questionMark(Placement)

    case colon
    case semicolon

    case equal
    case arrow
    case atSign

    case type
    case `protocol`

    case eof

    var token: TokenSyntax {
        switch self {
        case .angle(.left): return SyntaxFactory.makeLeftAngleToken()
        case .angle(.right): return SyntaxFactory.makeRightAngleToken()

        case .brace(.left): return SyntaxFactory.makeLeftBraceToken()
        case .brace(.right): return SyntaxFactory.makeRightBraceToken()

        case .paren(.left): return SyntaxFactory.makeLeftParenToken()
        case .paren(.right): return SyntaxFactory.makeRightParenToken()

        case .squareBracket(.left): return SyntaxFactory.makeLeftSquareBracketToken()
        case .squareBracket(.right): return SyntaxFactory.makeRightSquareBracketToken()

        case .comma: return SyntaxFactory.makeCommaToken()
        case .period: return SyntaxFactory.makePeriodToken()
        case .ellipsis: return SyntaxFactory.makeEllipsisToken()
        case .exclamationMark: return SyntaxFactory.makeExclamationMarkToken()

        case .questionMark(.infix): return SyntaxFactory.makeInfixQuestionMarkToken()
        case .questionMark(.postfix): return SyntaxFactory.makePostfixQuestionMarkToken()

        case .colon: return SyntaxFactory.makeColonToken()
        case .semicolon: return SyntaxFactory.makeSemicolonToken()

        case .equal: return SyntaxFactory.makeEqualToken()
        case .arrow: return SyntaxFactory.makeArrowToken()
        case .atSign: return SyntaxFactory.makeAtSignToken()

        case .type: return SyntaxFactory.makeTypeToken()
        case .protocol: return SyntaxFactory.makeProtocolToken()

        case .eof: return SyntaxFactory.makeToken(.eof, presence: .present)
        }
    }
}
