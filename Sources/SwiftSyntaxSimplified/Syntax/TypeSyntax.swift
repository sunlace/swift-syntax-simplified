import SwiftSyntax

extension SyntaxFactory.Simplified {

    public static func makeMemberTypeIdentifier(
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

    public static func makeMetatypeType(
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
