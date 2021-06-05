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

    static func makeSwitchStmt(
        labelName: TokenSyntax? = nil,
        expression: ExprSyntax,
        cases: [SwitchCaseSyntax]
    ) -> SwitchStmtSyntax {
        SyntaxFactory.makeSwitchStmt(
            labelName: labelName,
            labelColon: labelName.map { _ in SyntaxFactory.makeColonToken() },
            switchKeyword: SyntaxFactory.makeSwitchKeyword(),
            expression: expression,
            leftBrace: SyntaxFactory.makeLeftBraceToken(),
            cases: makeSwitchCaseList(cases),
            rightBrace: SyntaxFactory.makeRightBraceToken()
        )
    }
}
