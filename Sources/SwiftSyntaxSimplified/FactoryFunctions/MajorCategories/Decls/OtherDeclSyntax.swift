import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeAccessorDecl(
        attributes: [AttributeSyntax] = [],
        modifier: DeclModifierSyntax? = nil,
        accessorKind: TokenSyntax,
        parameterName: TokenSyntax? = nil,
        bodyStatements: [Syntax]?
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
                makeModifierList($0)
            },
            caseKeyword: KeywordTokenSyntax.case.token,
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
        bodyStatements: [Syntax]?
    ) -> FunctionDeclSyntax {
        SyntaxFactory.makeFunctionDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                makeModifierList($0)
            },
            funcKeyword: KeywordTokenSyntax.func.token,
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
                makeModifierList($0)
            },
            importTok: KeywordTokenSyntax.import.token,
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
        bodyStatements: [Syntax]?
    ) -> InitializerDeclSyntax {
        SyntaxFactory.makeInitializerDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                makeModifierList($0)
            },
            initKeyword: KeywordTokenSyntax.`init`.token,
            optionalMark: includeOptionalMark ? SimpleTokenSyntax.questionMark(.postfix).token : nil,
            genericParameterClause: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            parameters: makeParameterClause(parameters: parameters),
            throwsOrRethrowsKeyword: throwsOrRethrowsKeyword?.token,
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            body: bodyStatements.map { makeCodeBlock(statements: $0) }
        )
    }

    static func makeSubscriptDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        genericParameters: [GenericParameterSyntax] = [],
        indices: [FunctionParameterSyntax] = [],
        resultType: TypeSyntax,
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        accessor: AccessorSyntaxProtocol?
    ) -> SubscriptDeclSyntax {
        SyntaxFactory.makeSubscriptDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
            modifiers: modifiers.onlyIfNotEmpty.map {
                makeModifierList($0)
            },
            subscriptKeyword: KeywordTokenSyntax.subscript.token,
            genericParameterClause: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            indices: makeParameterClause(parameters: indices),
            result: makeReturnClause(returnType: resultType),
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            accessor: accessor?.typeErased
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
                makeModifierList($0)
            },
            letOrVarKeyword: letOrVarKeyword.token,
            bindings: makePatternBindingList(bindings)
        )
    }
}
