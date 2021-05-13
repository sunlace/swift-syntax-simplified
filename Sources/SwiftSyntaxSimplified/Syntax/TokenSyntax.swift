import SwiftSyntax

extension SyntaxFactory.Simplified {

    // MARK: Functions

    public static func makeDollarIdentifier(
        index: UInt
    ) -> TokenSyntax {
        SyntaxFactory.makeDollarIdentifier("$" + String(index))
    }

    // MARK: Enums

    public enum LetOrVarKeywordTokenSyntax {
        case letKeyword
        case varKeyword

        var token: TokenSyntax {
            switch self {
            case .letKeyword: return SyntaxFactory.makeLetKeyword()
            case .varKeyword: return SyntaxFactory.makeVarKeyword()
            }
        }
    }

    public enum QuestionOrExclamationMarkTokenSyntax {
        case questionMark
        case exclamationMark

        var token: TokenSyntax {
            switch self {
            case .questionMark: return SyntaxFactory.makePostfixQuestionMarkToken()
            case .exclamationMark: return SyntaxFactory.makeExclamationMarkToken()
            }
        }
    }

    public enum TypeOrProtocolTokenSyntax {
        case typeToken
        case protocolToken

        var token: TokenSyntax {
            switch self {
            case .typeToken: return SyntaxFactory.makeTypeToken()
            case .protocolToken: return SyntaxFactory.makeProtocolToken()
            }
        }
    }

    public enum ThrowsOrRethrowsKeywordTokenSyntax {
        case throwsKeyword
        case rethrowsKeyword

        var token: TokenSyntax {
            switch self {
            case .throwsKeyword: return SyntaxFactory.makeThrowsKeyword()
            case .rethrowsKeyword: return SyntaxFactory.makeRethrowsKeyword()
            }
        }
    }
}
