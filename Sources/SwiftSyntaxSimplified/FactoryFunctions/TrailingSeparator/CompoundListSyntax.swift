import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeClosureCaptureItemList(
        _ elements: [ClosureCaptureItemSyntax]
    ) -> ClosureCaptureItemListSyntax {
        SyntaxFactory.makeClosureCaptureItemList(elements.mapWithIsLast {
            SyntaxFactory.makeClosureCaptureItem(
                specifier: $0.element.specifier,
                name: $0.element.name,
                assignToken: $0.element.name.map { _ in SyntaxFactory.makeEqualToken() },
                expression: $0.element.expression,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
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
                colon: SyntaxFactory.makeColonToken(),
                valueExpression: $0.element.valueExpression,
                trailingComma: skipTrailingComma ? nil : SyntaxFactory.makeCommaToken()
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
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
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
                colon: isColonNecessary ? SyntaxFactory.makeColonToken() : nil,
                type: $0.element.type?.type,
                ellipsis: $0.element.type?.ellipsis,
                defaultArgument: $0.element.defaultArgument,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
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
                colon: $0.element.inheritedType.map { _ in SyntaxFactory.makeColonToken() },
                inheritedType: $0.element.inheritedType,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
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
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }

    static func makeTupleExprElementList(
        _ elements: [TupleExprElementSyntax] = []
    ) -> TupleExprElementListSyntax {
        SyntaxFactory.makeTupleExprElementList(elements.mapWithIsLast {
            SyntaxFactory.makeTupleExprElement(
                label: $0.element.label,
                colon: $0.element.label.map { _ in SyntaxFactory.makeColonToken() },
                expression: $0.element.expression,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }
}
