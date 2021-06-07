import SwiftSyntax

extension SyntaxFactory.Simplified {
    
    static func makeEnumCasePattern(
        type: TypeSyntax? = nil,
        caseName: TokenSyntax,
        associatedTuplePatternElements: [TuplePatternElementSyntax] = []
    ) -> EnumCasePatternSyntax {
        SyntaxFactory.makeEnumCasePattern(
            type: type,
            period: SimpleTokenSyntax.period.token,
            caseName: caseName,
            associatedTuple: associatedTuplePatternElements.onlyIfNotEmpty.map {
                makeTuplePattern(elements: $0)
            }
        )
    }

    static func makeTuplePattern(
        elements: [TuplePatternElementSyntax]
    ) -> TuplePatternSyntax {
        SyntaxFactory.makeTuplePattern(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            elements: makeTuplePatternElementList(elements),
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }
}
