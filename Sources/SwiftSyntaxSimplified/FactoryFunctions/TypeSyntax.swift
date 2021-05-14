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
}
