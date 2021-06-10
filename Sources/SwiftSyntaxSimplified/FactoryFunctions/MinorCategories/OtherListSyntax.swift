import SwiftSyntax

public extension SyntaxFactory.Simplified {

    // MARK: Type Erasure

    static func makeAttributeList(
        _ attributes: [AttributeSyntax]
    ) -> AttributeListSyntax {
        SyntaxFactory.makeAttributeList(attributes.map { $0.typeErased })
    }

    static func makeSwitchCaseList(
        _ cases: [SwitchCaseSyntax]
    ) -> SwitchCaseListSyntax {
        SyntaxFactory.makeSwitchCaseList(cases.map { $0.typeErased })
    }

    // MARK: Colons & Semicolons

    static func makeCodeBlockItemList(
        _ items: [Syntax], // TODO: Make protocol for allowed types
        includeSemicolons: Bool = false,
        errorTokens: Syntax? = nil // TODO: What is this for?
    ) -> CodeBlockItemListSyntax {
        SyntaxFactory.makeCodeBlockItemList(items.map {
            SyntaxFactory.makeCodeBlockItem(
                item: $0,
                semicolon: includeSemicolons ? SimpleTokenSyntax.semicolon.token : nil,
                errorTokens: errorTokens
            )
        })
    }

    static func makeMemberDeclList(
        _ decls: [DeclSyntax] = [],
        includeSemicolons: Bool = false
    ) -> MemberDeclListSyntax {
        SyntaxFactory.makeMemberDeclList(decls.map {
            SyntaxFactory.makeMemberDeclListItem(
                decl: $0,
                semicolon: includeSemicolons ? SimpleTokenSyntax.semicolon.token : nil
            )
        })
    }

    // MARK: Other

    static func makeDeclNameArgumentList(
        _ argumentNames: [TokenSyntax]
    ) -> DeclNameArgumentListSyntax {
        SyntaxFactory.makeDeclNameArgumentList(argumentNames.mapWithIsLast {
            SyntaxFactory.makeDeclNameArgument(
                name: $0.element,
                colon: SimpleTokenSyntax.colon.token
            )
        })
    }

    static func makeModifierList(
        _ modifiers: [DeclModifierSyntax]
    ) -> ModifierListSyntax {
        SyntaxFactory.makeModifierList(modifiers.map { makeDeclModifier($0) })
    }
}
