import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeClosureCaptureItemList(
        _ elements: [ClosureCaptureItemSyntax]
    ) -> ClosureCaptureItemListSyntax {
        SyntaxFactory.makeClosureCaptureItemList(elements.mapWithIsLast {
            SyntaxFactory.makeClosureCaptureItem(
                specifier: $0.element.specifier,
                name: $0.element.name,
                assignToken: $0.element.name.map { _ in SimpleTokenSyntax.equal.token },
                expression: $0.element.expression,
                trailingComma: $0.isLast ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }

    static func makeDictionaryElementList(
        _ elements: [DictionaryElementSyntax] = [],
        includeTrailingComma: Bool = false
    ) -> DictionaryElementListSyntax {
        SyntaxFactory.makeDictionaryElementList(elements.mapWithIsLast {
            let skipTrailingComma = $0.isLast && !includeTrailingComma

            return SyntaxFactory.makeDictionaryElement(
                keyExpression: $0.element.keyExpression,
                colon: SimpleTokenSyntax.colon.token,
                valueExpression: $0.element.valueExpression,
                trailingComma: skipTrailingComma ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }

    static func makeEnumCaseElementList(
        _ elements: [EnumCaseElementSyntax]
    ) -> EnumCaseElementListSyntax {
        SyntaxFactory.makeEnumCaseElementList(elements.mapWithIsLast {
            SyntaxFactory.makeEnumCaseElement(
                identifier: $0.element.identifier,
                associatedValue: $0.element.associatedValues.onlyIfNotEmpty.map {
                    makeParameterClause(parameters: $0)
                },
                rawValue: $0.element.rawValue.map { makeInitializerClause(value: $0) },
                trailingComma: $0.isLast ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }

    static func makeFunctionParameterList(
        _ elements: [FunctionParameterSyntax] = []
    ) -> FunctionParameterListSyntax {
        SyntaxFactory.makeFunctionParameterList(elements.mapWithIsLast {
            let isColonNecessary = $0.element.name != nil && $0.element.type != nil

            return SyntaxFactory.makeFunctionParameter(
                attributes: $0.element.attributes.onlyIfNotEmpty.map {
                    makeAttributeList($0)
                },
                firstName: $0.element.name?.firstName,
                secondName: $0.element.name?.secondName,
                colon: isColonNecessary ? SimpleTokenSyntax.colon.token : nil,
                type: $0.element.type?.type,
                ellipsis: $0.element.type?.includeEllipsis ?? false
                    ? SimpleTokenSyntax.ellipsis.token : nil,
                defaultArgument: $0.element.defaultArgument,
                trailingComma: $0.isLast ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }

    static func makeGenericParameterList(
        _ elements: [GenericParameterSyntax]
    ) -> GenericParameterListSyntax {
        SyntaxFactory.makeGenericParameterList(elements.mapWithIsLast {
            SyntaxFactory.makeGenericParameter(
                attributes: $0.element.attributes.onlyIfNotEmpty.map {
                    makeAttributeList($0)
                },
                name: $0.element.name,
                colon: $0.element.inheritedType.map { _ in SimpleTokenSyntax.colon.token },
                inheritedType: $0.element.inheritedType,
                trailingComma: $0.isLast ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }

    static func makePatternBindingList(
        _ elements: [PatternBindingSyntax]
    ) -> PatternBindingListSyntax {
        SyntaxFactory.makePatternBindingList(elements.mapWithIsLast {
            SyntaxFactory.makePatternBinding(
                pattern: $0.element.pattern,
                typeAnnotation: $0.element.type.map { makeTypeAnnotation(type: $0) },
                initializer: $0.element.initializerValue.map { makeInitializerClause(value: $0) },
                accessor: $0.element.accessor?.typeErased,
                trailingComma: $0.isLast ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }
}

public extension TupleExprElementListSyntax {

    init(
        @SyntaxListBuilder<TupleExprElementSyntax>
        buildElements: () -> [TupleExprElementSyntax]
    ) {
        self = SyntaxFactory.makeTupleExprElementList(buildElements().mapWithIsLast {
            $0.element
                .withTrailingComma($0.isLast ? nil : SimpleTokenSyntax.comma.token)
        })
    }
}

public extension TuplePatternElementListSyntax {
    init(
        @SyntaxListBuilder<TuplePatternElementSyntax>
        buildElements: () -> [TuplePatternElementSyntax]
    ) {
        self = SyntaxFactory.makeTuplePatternElementList(buildElements().mapWithIsLast {
            $0.element.rawValue
                .withTrailingComma($0.isLast ? nil : SimpleTokenSyntax.comma.token)
        })
    }
}

public extension SyntaxFactory.Simplified {
    
    static func makeTupleTypeElementList(
        _ elements: [TupleTypeElementSyntax] = []
    ) -> TupleTypeElementListSyntax {
        SyntaxFactory.makeTupleTypeElementList(elements.mapWithIsLast {
            SyntaxFactory.makeTupleTypeElement(
                inOut: $0.element.includeInOut ? KeywordTokenSyntax.inout.token : nil,
                name: $0.element.name?.firstName,
                secondName: $0.element.name?.secondName,
                colon: $0.element.name.map { _ in SimpleTokenSyntax.colon.token },
                type: $0.element.type,
                ellipsis: $0.element.includeEllipsis ? SimpleTokenSyntax.ellipsis.token : nil,
                initializer: $0.element.initializerValue.map { makeInitializerClause(value: $0) },
                trailingComma: $0.isLast ? nil : SimpleTokenSyntax.comma.token
            )
        })
    }
}
