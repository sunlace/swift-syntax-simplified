import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeSwitchCaseLabel(
        caseItems: [CaseItemSyntax]
    ) -> SwitchCaseLabelSyntax {
        SyntaxFactory.makeSwitchCaseLabel(
            caseKeyword: KeywordTokenSyntax.case.token,
            caseItems: makeCaseItemList(caseItems),
            colon: SimpleTokenSyntax.colon.token
        )
    }

    static func makeSwitchDefaultLabel() -> SwitchDefaultLabelSyntax {
        SyntaxFactory.makeSwitchDefaultLabel(
            defaultKeyword: KeywordTokenSyntax.default.token,
            colon: SimpleTokenSyntax.colon.token
        )
    }
}
