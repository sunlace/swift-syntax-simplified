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
            period: SimpleTokenSyntax.period.token,
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
            period: SimpleTokenSyntax.period.token,
            typeOrProtocol: typeOrProtocol.token
        )
    }

    static func makeOptionalType(
        wrappedType: TypeSyntax
    ) -> OptionalTypeSyntax {
        SyntaxFactory.makeOptionalType(
            wrappedType: wrappedType,
            questionMark: SimpleTokenSyntax.questionMark(.postfix).token
        )
    }

    static func makeArrayType(
        elementType: TypeSyntax
    ) -> ArrayTypeSyntax {
        SyntaxFactory.makeArrayType(
            leftSquareBracket: SimpleTokenSyntax.squareBracket(.left).token,
            elementType: elementType,
            rightSquareBracket: SimpleTokenSyntax.squareBracket(.right).token
        )
    }

    static func makeDictionaryType(
        keyType: TypeSyntax,
        valueType: TypeSyntax
    ) -> DictionaryTypeSyntax {
        SyntaxFactory.makeDictionaryType(
            leftSquareBracket: SimpleTokenSyntax.squareBracket(.left).token,
            keyType: keyType,
            colon: SimpleTokenSyntax.colon.token,
            valueType: valueType,
            rightSquareBracket: SimpleTokenSyntax.squareBracket(.right).token
        )
    }

    static func makeTupleType(
        elementTypes: [TupleTypeElementSyntax] = []
    ) -> TupleTypeSyntax {
        SyntaxFactory.makeTupleType(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            elements: makeTupleTypeElementList(elementTypes),
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }

    @available(*, unavailable, renamed: "makeTupleType()")
    static func makeVoidTupleType() -> TupleTypeSyntax {
        makeTupleType()
    }
}
