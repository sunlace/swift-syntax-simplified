import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeAccessorDecl(
        attributes: [AttributeSyntax] = [],
        modifier: DeclModifierSyntax? = nil,
        accessorKind: TokenSyntax,
        parameterName: TokenSyntax? = nil,
        bodyStatements: [CodeBlockItemSyntax]?
    ) -> AccessorDeclSyntax {
        SyntaxFactory.makeAccessorDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifier: modifier.map { makeDeclModifier($0) },
            accessorKind: accessorKind,
            parameter: parameterName.map { makeAccessorParameter(name: $0) },
            body: bodyStatements.map { makeCodeBlock(statements: $0) }
        )
    }

    static func makeEnumCaseDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        elements: [EnumCaseElementSyntax]
    ) -> EnumCaseDeclSyntax {
        SyntaxFactory.makeEnumCaseDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            caseKeyword: SyntaxFactory.makeCaseKeyword(),
            elements: makeEnumCaseElementList(elements)
        )
    }

    static func makeFunctionDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        signature: FunctionSignatureSyntax,
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        bodyStatements: [CodeBlockItemSyntax]? = nil
    ) -> FunctionDeclSyntax {
        SyntaxFactory.makeFunctionDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
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
    
    static func makeImportDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        importKind: TokenSyntax? = nil,
        pathComponentNames: [TokenSyntax]
    ) -> ImportDeclSyntax {
        SyntaxFactory.makeImportDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            importTok: SyntaxFactory.makeImportKeyword(),
            importKind: importKind,
            path: makeAccessPath(pathComponentNames)
        )
    }
    
    static func makeInitializerDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        includeOptionalMark: Bool = false,
        genericParameters: [GenericParameterSyntax] = [],
        parameters: [FunctionParameterSyntax] = [],
        throwsOrRethrowsKeyword: ThrowsOrRethrowsKeywordTokenSyntax? = nil,
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        bodyStatements: [CodeBlockItemSyntax]? = nil
    ) -> InitializerDeclSyntax {
        SyntaxFactory.makeInitializerDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
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

    static func makeVariableDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        letOrVarKeyword: LetOrVarKeywordTokenSyntax,
        bindings: [PatternBindingSyntax]
    ) -> VariableDeclSyntax {
        SyntaxFactory.makeVariableDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            letOrVarKeyword: letOrVarKeyword.token,
            bindings: makePatternBindingList(bindings)
        )
    }
}
