import SwiftSyntax

public extension MatchingPatternConditionSyntax {
    init(
        pattern: PatternSyntax,
        initializerValue: ExprSyntax
    ) {
        self = SyntaxFactory.makeMatchingPatternCondition(
            caseKeyword: KeywordTokenSyntax.case.token,
            pattern: pattern,
            typeAnnotation: nil,
            initializer: InitializerClauseSyntax(value: initializerValue)
        )
    }

    func withType(_ newChild: TypeSyntax?) -> Self {
        withTypeAnnotation(
            type.map { TypeAnnotationSyntax(type: $0) }
        )
    }

    var type: TypeSyntax? { typeAnnotation?.type }
}
