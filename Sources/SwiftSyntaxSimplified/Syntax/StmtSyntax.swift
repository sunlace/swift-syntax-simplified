import SwiftSyntax

extension SyntaxFactory.Simplified {

    public static func makeReturnStmt(
        expression: ExprSyntax?
    ) -> ReturnStmtSyntax {
        SyntaxFactory.makeReturnStmt(
            returnKeyword: SyntaxFactory.makeReturnKeyword(),
            expression: expression
        )
    }
}
