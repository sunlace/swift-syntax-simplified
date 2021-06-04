import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeSimpleTypeIdentifier(
        name: TokenSyntax,
        genericArgumentClauseArgumentTypes: [TypeSyntax] = []
    ) -> SimpleTypeIdentifierSyntax {
        SyntaxFactory.makeSimpleTypeIdentifier(
            name: name,
            genericArgumentClause: genericArgumentClauseArgumentTypes.onlyIfNotEmpty.map {
                makeGenericArgumentClause(argumentTypes: $0)
            }
        )
    }

    static func makeMemberTypeIdentifier(
        baseType: TypeSyntax,
        name: TokenSyntax,
        genericArgumentClauseArgumentTypes: [TypeSyntax] = []
    ) -> MemberTypeIdentifierSyntax {
        SyntaxFactory.makeMemberTypeIdentifier(
            baseType: baseType,
            period: SyntaxFactory.makePeriodToken(),
            name: name,
            genericArgumentClause: genericArgumentClauseArgumentTypes.onlyIfNotEmpty.map {
                makeGenericArgumentClause(argumentTypes: $0)
            }
        )
    }

    static func makeMetatypeType(
        baseType: TypeSyntax,
        typeOrProtocol: TypeOrProtocolTokenSyntax
    ) -> MetatypeTypeSyntax {
        SyntaxFactory.makeMetatypeType(
            baseType: baseType,
            period: SyntaxFactory.makePeriodToken(),
            typeOrProtocol: typeOrProtocol.token
        )
    }

    static func makeOptionalType(
        wrappedType: TypeSyntax
    ) -> OptionalTypeSyntax {
        SyntaxFactory.makeOptionalType(
            wrappedType: wrappedType,
            questionMark: SyntaxFactory.makePostfixQuestionMarkToken()
        )
    }

    static func makeArrayType(
        elementType: TypeSyntax
    ) -> ArrayTypeSyntax {
        SyntaxFactory.makeArrayType(
            leftSquareBracket: SyntaxFactory.makeLeftSquareBracketToken(),
            elementType: elementType,
            rightSquareBracket: SyntaxFactory.makeRightSquareBracketToken()
        )
    }

    static func makeDictionaryType(
        keyType: TypeSyntax,
        valueType: TypeSyntax
    ) -> DictionaryTypeSyntax {
        SyntaxFactory.makeDictionaryType(
            leftSquareBracket: SyntaxFactory.makeLeftSquareBracketToken(),
            keyType: keyType,
            colon: SyntaxFactory.makeColonToken(),
            valueType: valueType,
            rightSquareBracket: SyntaxFactory.makeRightSquareBracketToken()
        )
    }
}
