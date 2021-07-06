import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeGuardStmt(
        conditions: [Syntax],
        bodyStatements: [Syntax]
    ) -> GuardStmtSyntax {
        SyntaxFactory.makeGuardStmt(
            guardKeyword: KeywordTokenSyntax.guard.token,
            conditions: makeConditionElementList(conditions),
            elseKeyword: KeywordTokenSyntax.else.token,
            body: makeCodeBlock(statements: bodyStatements)
        )
    }

    static func makeIfStmt(
        labelName: TokenSyntax? = nil,
        conditions: [Syntax],
        bodyStatements: [Syntax] = [],
        elseBody: ElseBodySyntax? = nil
    ) -> IfStmtSyntax {
        SyntaxFactory.makeIfStmt(
            labelName: labelName,
            labelColon: labelName.map { _ in SimpleTokenSyntax.colon.token },
            ifKeyword: SyntaxFactory.makeIfKeyword(),
            conditions: makeConditionElementList(conditions),
            body: makeCodeBlock(statements: bodyStatements),
            elseKeyword: elseBody.map { _ in KeywordTokenSyntax.else.token },
            elseBody: elseBody?.typeErased
        )
    }

    static func makeReturnStmt(
        expression: ExprSyntax? = nil
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
