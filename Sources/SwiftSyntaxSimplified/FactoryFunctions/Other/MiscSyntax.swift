import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeMultipleTrailingClosureElement(
        label: TokenSyntax,
        closure: ClosureExprSyntax
    ) -> MultipleTrailingClosureElementSyntax {
        SyntaxFactory.makeMultipleTrailingClosureElement(
            label: label,
            colon: SyntaxFactory.makeColonToken(),
            closure: closure
        )
    }

    static func makeAccessorParameter(
        name: TokenSyntax
    ) -> AccessorParameterSyntax {
        SyntaxFactory.makeAccessorParameter(
            leftParen: SyntaxFactory.makeLeftParenToken(),
            name: name,
            rightParen: SyntaxFactory.makeRightParenToken()
        )
    }

    static func makeTypeAnnotation(
        type: TypeSyntax
    ) -> TypeAnnotationSyntax {
        SyntaxFactory.makeTypeAnnotation(
            colon: SyntaxFactory.makeColonToken(),
            type: type
        )
    }

    static func makeMemberDeclList(
        _ decls: [DeclSyntax] = [],
        includeSemicolons: Bool = false
    ) -> MemberDeclListSyntax {
        SyntaxFactory.makeMemberDeclList(decls.map {
            SyntaxFactory.makeMemberDeclListItem(
                decl: $0,
                semicolon: includeSemicolons ? SyntaxFactory.makeSemicolonToken() : nil
            )
        })
    }

    static func makeSourceFile(
        statements: [CodeBlockItemSyntax] = []
    ) -> SourceFileSyntax {
        SyntaxFactory.makeSourceFile(
            statements: SyntaxFactory.makeCodeBlockItemList(statements),
            eofToken: SyntaxFactory.makeToken(.eof, presence: .present)
        )
    }

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

    static func makeAttribute(
        attributeName: TokenSyntax,
        argument: Syntax? = nil,
        tokenList: TokenListSyntax? = nil // TODO: What is this for?
    ) -> AttributeSyntax {
        SyntaxFactory.makeAttribute(
            atSignToken: SyntaxFactory.makeAtSignToken(),
            attributeName: attributeName,
            leftParen: argument.map { _ in SyntaxFactory.makeLeftParenToken() },
            argument: argument,
            rightParen: argument.map { _ in SyntaxFactory.makeRightParenToken() },
            tokenList: tokenList
        )
    }

    static func makeSwitchCase(
        includeUnknownAttr: Bool = false,
        label: LabelSyntaxProtocol,
        statements: [CodeBlockItemSyntax]
    ) -> SwitchCaseSyntax {
        SyntaxFactory.makeSwitchCase(
            unknownAttr: makeAttribute(
                attributeName: SyntaxFactory.makeIdentifier("unknown")
            ),
            label: label.typeErased,
            statements: SyntaxFactory.makeCodeBlockItemList(statements)
        )
    }
}
