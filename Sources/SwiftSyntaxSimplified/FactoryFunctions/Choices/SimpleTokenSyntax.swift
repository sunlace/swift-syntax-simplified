import SwiftSyntax

public enum SimpleTokenSyntax {

    public enum Side {
        case left
        case right
    }

    public enum Placement {
        case infix
        case postfix
    }

    public enum Quote {
        case single // TODO: What is this used for?
        case string
        case multilineString
    }

    case angle(Side)
    case brace(Side)
    case paren(Side)
    case squareBracket(Side)

    case comma
    case period
    case ellipsis
    case exclamationMark

    case pound
    case backslash
    case backtick

    case questionMark(Placement)
    case quote(Quote)

    case colon
    case semicolon

    case equal
    case arrow
    case atSign

    case type
    case `protocol`
    case underscore

    case eof

    public var token: TokenSyntax {
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

        case .quote(.single): return SyntaxFactory.makeSingleQuoteToken()
        case .quote(.string): return SyntaxFactory.makeStringQuoteToken()
        case .quote(.multilineString): return SyntaxFactory.makeMultilineStringQuoteToken()

        case .pound: return SyntaxFactory.makePoundToken()
        case .backslash: return SyntaxFactory.makeBackslashToken()
        case .backtick: return SyntaxFactory.makeBacktickToken()

        case .colon: return SyntaxFactory.makeColonToken()
        case .semicolon: return SyntaxFactory.makeSemicolonToken()

        case .equal: return SyntaxFactory.makeEqualToken()
        case .arrow: return SyntaxFactory.makeArrowToken()
        case .atSign: return SyntaxFactory.makeAtSignToken()

        case .type: return SyntaxFactory.makeTypeToken()
        case .protocol: return SyntaxFactory.makeProtocolToken()
        case .underscore: return SyntaxFactory.makeIdentifier("_")

        case .eof: return SyntaxFactory.makeToken(.eof, presence: .present)
        }
    }
}
