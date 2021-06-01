import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeGenericRequirementList(
        _ bodies: [RequirementSyntaxProtocol]
    ) -> GenericRequirementListSyntax {
        SyntaxFactory.makeGenericRequirementList(bodies.mapWithIsLast {
            SyntaxFactory.makeGenericRequirement(
                body: $0.element.typeErased,
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

    static func makeArrayElementList(
        _ expressions: [ExprSyntax] = [],
        includeTrailingComma: Bool = false
    ) -> ArrayElementListSyntax {
        SyntaxFactory.makeArrayElementList(expressions.mapWithIsLast {
            let skipTrailingComma = $0.isLast && !includeTrailingComma

            return SyntaxFactory.makeArrayElement(
                expression: $0.element,
                trailingComma: skipTrailingComma ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }

    static func makeGenericArgumentList(
        _ argumentTypes: [TypeSyntax]
    ) -> GenericArgumentListSyntax {
        SyntaxFactory.makeGenericArgumentList(argumentTypes.mapWithIsLast {
            SyntaxFactory.makeGenericArgument(
                argumentType: $0.element,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }

    static func makeGenericParameterList(
        _ elements: [GenericParameterSyntax]
    ) -> GenericParameterListSyntax {
        SyntaxFactory.makeGenericParameterList(elements.mapWithIsLast {
            SyntaxFactory.makeGenericParameter(
                attributes: $0.element.attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
                name: $0.element.name,
                colon: $0.element.inheritedType.map { _ in SyntaxFactory.makeColonToken() },
                inheritedType: $0.element.inheritedType,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }

    static func makeFunctionParameterList(
        _ elements: [FunctionParameterSyntax] = []
    ) -> FunctionParameterListSyntax {
        SyntaxFactory.makeFunctionParameterList(elements.mapWithIsLast {
            SyntaxFactory.makeFunctionParameter(
                attributes: $0.element.attributes.onlyIfNotEmpty.map { SyntaxFactory.makeAttributeList($0) },
                firstName: $0.element.firstName,
                secondName: $0.element.secondName,
                colon: $0.element.type.map { _ in SyntaxFactory.makeColonToken() },
                type: $0.element.type?.type,
                ellipsis: $0.element.type?.ellipsis,
                defaultArgument: $0.element.defaultArgument,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })

    }

    static func makeInheritedTypeList(
        _ typeNames: [TypeSyntax]) -> InheritedTypeListSyntax {
        SyntaxFactory.makeInheritedTypeList(typeNames.mapWithIsLast {
            SyntaxFactory.makeInheritedType(
                typeName: $0.element,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }

    static func makeAccessPath(
        _ componentNames: [TokenSyntax]
    ) -> AccessPathSyntax {
        SyntaxFactory.makeAccessPath(componentNames.mapWithIsLast {
            SyntaxFactory.makeAccessPathComponent(
                name: $0.element,
                trailingDot: $0.isLast ? nil : SyntaxFactory.makePeriodToken()
            )
        })
    }

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

    static func makeClosureParamList(
        _ paramNames: [TokenSyntax]
    ) -> ClosureParamListSyntax {
        SyntaxFactory.makeClosureParamList(paramNames.mapWithIsLast {
            SyntaxFactory.makeClosureParam(
                name: $0.element,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }
}
