import SwiftSyntax

public enum LetOrVarKeywordTokenSyntax {
    case letKeyword
    case varKeyword

    var token: TokenSyntax {
        switch self {
        case .letKeyword: return KeywordTokenSyntax.let.token
        case .varKeyword: return KeywordTokenSyntax.var.token
        }
    }
}

public enum QuestionOrExclamationMarkTokenSyntax {
    case questionMark
    case exclamationMark

    var token: TokenSyntax {
        switch self {
        case .questionMark: return SimpleTokenSyntax.questionMark(.postfix).token
        case .exclamationMark: return SimpleTokenSyntax.exclamationMark.token
        }
    }
}

public enum TypeOrProtocolTokenSyntax {
    case typeToken
    case protocolToken

    var token: TokenSyntax {
        switch self {
        case .typeToken: return SimpleTokenSyntax.type.token
        case .protocolToken: return SimpleTokenSyntax.protocol.token
        }
    }
}

public enum ThrowsOrRethrowsKeywordTokenSyntax {
    case throwsKeyword
    case rethrowsKeyword

    var token: TokenSyntax {
        switch self {
        case .throwsKeyword: return KeywordTokenSyntax.throws.token
        case .rethrowsKeyword: return KeywordTokenSyntax.rethrows.token
        }
    }
}
