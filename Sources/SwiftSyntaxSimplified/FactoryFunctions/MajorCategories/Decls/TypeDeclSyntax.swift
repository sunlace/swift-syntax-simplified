import SwiftSyntax

extension SyntaxFactory.Simplified {

    static func makeEnumDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        inheritedTypes: [TypeSyntax] = [],
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        memberDecls: [DeclSyntax] = []
    ) -> EnumDeclSyntax {
        SyntaxFactory.makeEnumDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
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

    static func makeClassDecl(
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        inheritedTypes: [TypeSyntax] = [],
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        memberDecls: [DeclSyntax] = []
    ) -> ClassDeclSyntax {
        SyntaxFactory.makeClassDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
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
        attributes: [AttributeSyntax] = [],
        modifiers: [DeclModifierSyntax] = [],
        identifier: TokenSyntax,
        genericParameters: [GenericParameterSyntax] = [],
        inheritedTypes: [TypeSyntax] = [],
        genericWhereClauseElementBodies: [RequirementSyntaxProtocol] = [],
        memberDecls: [DeclSyntax] = []
    ) -> StructDeclSyntax {
        SyntaxFactory.makeStructDecl(
            attributes: attributes.onlyIfNotEmpty.map {
                makeAttributeList($0)
            },
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
}
