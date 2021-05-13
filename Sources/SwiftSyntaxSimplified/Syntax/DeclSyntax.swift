import SwiftSyntax

extension SyntaxFactory.Simplified {
    
    public static func makeImportDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        importKind: TokenSyntax? = nil,
        pathComponentNames: [TokenSyntax]
    ) -> ImportDeclSyntax {
        SyntaxFactory.makeImportDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map { SyntaxFactory.makeModifierList($0) },
            importTok: SyntaxFactory.makeImportKeyword(),
            importKind: importKind,
            path: makeAccessPath(pathComponentNames)
        )
    }
    
    public static func makeInitializerDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        includeOptionalMark: Bool = false,
        genericParameters: [GenericParameterSyntax] = [],
        parameters: [FunctionParameterSyntax] = [],
        throwsOrRethrowsKeyword: ThrowsOrRethrowsKeywordTokenSyntax? = nil,
        genericWhereClauseElementBodies: [Syntax] = [],
        bodyStatements: [CodeBlockItemSyntax]? = nil
    ) -> InitializerDeclSyntax {
        SyntaxFactory.makeInitializerDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map { SyntaxFactory.makeModifierList($0) },
            initKeyword: SyntaxFactory.makeInitKeyword(),
            optionalMark: includeOptionalMark ? SyntaxFactory.makePostfixQuestionMarkToken() : nil,
            genericParameterClause: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            parameters: makeParameterClause(parameters: parameters),
            throwsOrRethrowsKeyword: throwsOrRethrowsKeyword.map { $0.token },
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            body: bodyStatements.map { makeCodeBlock(statements: $0) }
        )
    }
    
    public static func makeFunctionDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        signature: FunctionSignatureSyntax,
        genericWhereClauseElementBodies: [Syntax] = [],
        bodyStatements: [CodeBlockItemSyntax]? = nil
    ) -> FunctionDeclSyntax {
        SyntaxFactory.makeFunctionDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map { SyntaxFactory.makeModifierList($0) },
            funcKeyword: SyntaxFactory.makeFuncKeyword(),
            identifier: identifier,
            genericParameterClause: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            signature: signature,
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            body: bodyStatements.map { makeCodeBlock(statements: $0) }
        )
    }
}
