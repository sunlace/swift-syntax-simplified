import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeReturnStmt(
        expression: ExprSyntax?
    ) -> ReturnStmtSyntax {
        SyntaxFactory.makeReturnStmt(
            returnKeyword: SyntaxFactory.makeReturnKeyword(),
            expression: expression
        )
    }
}
