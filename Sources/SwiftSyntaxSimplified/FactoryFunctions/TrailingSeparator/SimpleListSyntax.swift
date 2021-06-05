import SwiftSyntax

public extension SyntaxFactory.Simplified {

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

    static func makeInheritedTypeList(
        _ typeNames: [TypeSyntax]
    ) -> InheritedTypeListSyntax {
        SyntaxFactory.makeInheritedTypeList(typeNames.mapWithIsLast {
            SyntaxFactory.makeInheritedType(
                typeName: $0.element,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }

    static func makeTupleTypeElementList(
        _ elementTypes: [TypeSyntax]
    ) -> TupleTypeElementListSyntax {
        SyntaxFactory.makeTupleTypeElementList(elementTypes.mapWithIsLast {
            SyntaxFactory.makeTupleTypeElement(
                type: $0.element,
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })

    }

    static func makeCaseItemList(
        _ elements: [CaseItemSyntax]) -> CaseItemListSyntax {
        SyntaxFactory.makeCaseItemList(elements.mapWithIsLast {
            SyntaxFactory.makeCaseItem(
                pattern: $0.element.pattern,
                whereClause: $0.element.guardResult.map { makeWhereClause(guardResult: $0) },
                trailingComma: $0.isLast ? nil : SyntaxFactory.makeCommaToken()
            )
        })
    }
}