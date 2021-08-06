import SwiftSyntax

public extension EnumCasePatternSyntax {
    init(
        caseName: TokenSyntax
    ) {
        self = SyntaxFactory.makeEnumCasePattern(
            type: nil,
            period: SimpleTokenSyntax.period.token,
            caseName: caseName,
            associatedTuple: nil
        )
    }

    func withAssociatedTuple(
        @SyntaxListBuilder<TuplePatternElementSyntax>
        buildAssociatedTuplePatternElements: () -> [TuplePatternElementSyntax]
    ) -> EnumCasePatternSyntax {
        withAssociatedTuple(
            TuplePatternSyntax(buildElements: buildAssociatedTuplePatternElements)
        )
    }
}

public extension IdentifierPatternSyntax {
    init(
        identifier: TokenSyntax
    ) {
        self = SyntaxFactory.makeIdentifierPattern(
            identifier: identifier
        )
    }
}

public extension TuplePatternSyntax {
    init(
        @SyntaxListBuilder<TuplePatternElementSyntax>
        buildElements: () -> [TuplePatternElementSyntax]
    ) {
        self = SyntaxFactory.makeTuplePattern(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            elements: TuplePatternElementListSyntax(buildElements: buildElements),
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }
}

public extension ValueBindingPatternSyntax {
    init<Pattern: PatternSyntaxProtocol>(
        letOrVarKeyword: LetOrVarKeywordTokenSyntax,
        valuePattern: Pattern
    ) {
        self = SyntaxFactory.makeValueBindingPattern(
            letOrVarKeyword: letOrVarKeyword.token,
            valuePattern: valuePattern.typeErased
        )
    }
}

public extension WildcardPatternSyntax {
    init() {
        self = SyntaxFactory.makeWildcardPattern(
            wildcard: SimpleTokenSyntax.underscore.token,
            typeAnnotation: nil
        )
    }
}
