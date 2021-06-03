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
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
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

    static func makeAccessorDecl(
        attributes: [Syntax] = [],
        modifier: DeclModifierSyntax? = nil,
        accessorKind: TokenSyntax,
        parameterName: TokenSyntax? = nil,
        bodyStatements: [CodeBlockItemSyntax]?
    ) -> AccessorDeclSyntax {
        SyntaxFactory.makeAccessorDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifier: modifier.map { makeDeclModifier($0) },
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
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            letOrVarKeyword: letOrVarKeyword.token,
            bindings: makePatternBindingList(bindings)
        )
    }

    static func makeClassDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        inheritedTypes: [TypeSyntax] = [],
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        memberDecls: [DeclSyntax] = []
    ) -> ClassDeclSyntax {
        SyntaxFactory.makeClassDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            classKeyword: SyntaxFactory.makeClassKeyword(),
            identifier: identifier,
            genericParameterClause: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            inheritanceClause: inheritedTypes.onlyIfNotEmpty.map {
                makeTypeInheritanceClause(inheritedTypes: $0)
            },
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            members: makeMemberDeclBlock(memberDecls: memberDecls)
        )
    }

    static func makeStructDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        inheritedTypes: [TypeSyntax] = [],
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        memberDecls: [DeclSyntax] = []
    ) -> StructDeclSyntax {
        SyntaxFactory.makeStructDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            structKeyword: SyntaxFactory.makeStructKeyword(),
            identifier: identifier,
            genericParameterClause: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            inheritanceClause: inheritedTypes.onlyIfNotEmpty.map {
                makeTypeInheritanceClause(inheritedTypes: $0)
            },
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            members: makeMemberDeclBlock(memberDecls: memberDecls)
        )
    }

    static func makeEnumDecl(
        attributes: [Syntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        inheritedTypes: [TypeSyntax] = [],
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        memberDecls: [DeclSyntax] = []
    ) -> EnumDeclSyntax {
        SyntaxFactory.makeEnumDecl(
            attributes: attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
            modifiers: modifiers.onlyIfNotEmpty.map {
                SyntaxFactory.makeModifierList($0.map { makeDeclModifier($0) })
            },
            enumKeyword: SyntaxFactory.makeEnumKeyword(),
            identifier: identifier,
            genericParameters: genericParameters.onlyIfNotEmpty.map {
                makeGenericParameterClause(genericParameters: $0)
            },
            inheritanceClause: inheritedTypes.onlyIfNotEmpty.map {
                makeTypeInheritanceClause(inheritedTypes: $0)
            },
            genericWhereClause: genericWhereClauseElementBodies.onlyIfNotEmpty.map {
                makeGenericWhereClause(requirementBodies: $0)
            },
            members: makeMemberDeclBlock(memberDecls: memberDecls)
        )
    }
}
