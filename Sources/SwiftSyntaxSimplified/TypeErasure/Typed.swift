import SwiftSyntax

// The explicit unwrapping is guaranteed to succeed
// due to how SwiftSyntax works under the hood

public extension Syntax {

    var typed: SyntaxProtocol {
        return syntaxNodeType.init(self)!
    }
}

public extension ExprSyntax {

    var typed: ExprSyntaxProtocol {
        return (syntaxNodeType as! ExprSyntaxProtocol.Type).init(Syntax(self))!
    }
}

public extension DeclSyntax {

    var typed: DeclSyntaxProtocol {
        return (syntaxNodeType as! DeclSyntaxProtocol.Type).init(Syntax(self))!
    }
}

public extension TypeSyntax {

    var typed: TypeSyntaxProtocol {
        return (syntaxNodeType as! TypeSyntaxProtocol.Type).init(Syntax(self))!
    }
}

public extension StmtSyntax {

    var typed: StmtSyntaxProtocol {
        return (syntaxNodeType as! StmtSyntaxProtocol.Type).init(Syntax(self))!
    }
}

public extension PatternSyntax {

    var typed: PatternSyntaxProtocol {
        return (syntaxNodeType as! PatternSyntaxProtocol.Type).init(Syntax(self))!
    }
}
