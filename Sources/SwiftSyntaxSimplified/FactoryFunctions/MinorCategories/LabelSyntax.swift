import SwiftSyntax

extension SyntaxFactory.Simplified {

    public static func makeSwitchCaseLabel(
        caseItems: [CaseItemSyntax]
    ) -> SwitchCaseLabelSyntax {
        SyntaxFactory.makeSwitchCaseLabel(
            caseKeyword: SyntaxFactory.makeCaseKeyword(),
            caseItems: makeCaseItemList(caseItems),
            colon: SyntaxFactory.makeColonToken()
        )
    }

    public static func makeSwitchDefaultLabel() -> SwitchDefaultLabelSyntax {
        SyntaxFactory.makeSwitchDefaultLabel(
            defaultKeyword: SyntaxFactory.makeDefaultKeyword(),
            colon: SyntaxFactory.makeColonToken()
        )
    }
}
