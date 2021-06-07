import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeReturnStmt(
        expression: ExprSyntax?
    ) -> ReturnStmtSyntax {
        SyntaxFactory.makeReturnStmt(
            returnKeyword: KeywordTokenSyntax.return.token,
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
            labelColon: labelName.map { _ in SimpleTokenSyntax.colon.token },
            switchKeyword: KeywordTokenSyntax.switch.token,
            expression: expression,
            leftBrace: SimpleTokenSyntax.brace(.left).token,
            cases: makeSwitchCaseList(cases),
            rightBrace: SimpleTokenSyntax.brace(.right).token
        )
    }
}
