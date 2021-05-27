import SwiftSyntax

public extension SyntaxFactory.Simplified {
    
    static func makeImportDecl(
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
    
    static func makeInitializerDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        includeOptionalMark: Bool = false,
        genericParameters: [GenericParameterSyntax] = [],
        parameters: [FunctionParameterSyntax] = [],
        throwsOrRethrowsKeyword: ThrowsOrRethrowsKeywordTokenSyntax? = nil,
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
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
    
    static func makeFunctionDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        signature: FunctionSignatureSyntax,
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
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

    static func makeAccessorDecl(
        attributes: [Syntax] = [],
        modifier: DeclModifierSyntax? = nil,
        accessorKind: TokenSyntax,
        parameterName: TokenSyntax? = nil,
        bodyStatements: [CodeBlockItemSyntax]?
    ) -> AccessorDeclSyntax {
        SyntaxFactory.makeAccessorDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifier: modifier,
            accessorKind: accessorKind,
            parameter: parameterName.map { makeAccessorParameter(name: $0) },
            body: bodyStatements.map { makeCodeBlock(statements: $0) }
        )
    }

    static func makeVariableDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        letOrVarKeyword: LetOrVarKeywordTokenSyntax,
        bindings: [PatternBindingSyntax]
    ) -> VariableDeclSyntax {
        SyntaxFactory.makeVariableDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map { SyntaxFactory.makeModifierList($0) },
            letOrVarKeyword: letOrVarKeyword.token,
            bindings: makePatternBindingList(bindings)
        )
    }
}
