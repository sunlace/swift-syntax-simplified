import SwiftSyntax

public extension SyntaxProtocol {

    var typeErased: Syntax {
        return Syntax(self)
    }
}

public extension ExprSyntaxProtocol {

    var typeErased: ExprSyntax {
        return ExprSyntax(self)
    }
}

public extension DeclSyntaxProtocol {

    var typeErased: DeclSyntax {
        return DeclSyntax(self)
    }
}

public extension TypeSyntaxProtocol {

    var typeErased: TypeSyntax {
        return TypeSyntax(self)
    }
}

public extension StmtSyntaxProtocol {

    var typeErased: StmtSyntax {
        return StmtSyntax(self)
    }
}

public extension PatternSyntaxProtocol {

    var typeErased: PatternSyntax {
        return PatternSyntax(self)
    }
}
