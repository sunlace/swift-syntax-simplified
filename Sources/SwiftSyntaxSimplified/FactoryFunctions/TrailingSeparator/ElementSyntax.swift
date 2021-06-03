import SwiftSyntax

public struct TupleExprElementSyntax {
    let label: TokenSyntax?,
        expression: ExprSyntax
}

public struct FunctionParameterSyntax {
    let attributes: [Syntax],
        name: FunctionParameterNameGroupSyntax?,
        type: FunctionParameterTypeGroupSyntax?,
        defaultArgument: InitializerClauseSyntax?
}

public struct GenericParameterSyntax {
    let attributes: [Syntax],
        name: TokenSyntax,
        inheritedType: TypeSyntax?
}

public struct PatternBindingSyntax {
    let pattern: PatternSyntax,
        type: TypeSyntax?,
        initializerValue: ExprSyntax?,
        accessor: AccessorSyntaxProtocol?
}

public struct ClosureCaptureItemSyntax {
    let specifier: TokenListSyntax?,
        name: TokenSyntax?,
        expression: ExprSyntax
}

public struct EnumCaseElementSyntax {
    let identifier: TokenSyntax,
        associatedValues: [FunctionParameterSyntax],
        rawValue: ExprSyntax?
}

public extension SyntaxFactory.Simplified {

    static func makeTupleExprElement(
        label: TokenSyntax? = nil,
        expression: ExprSyntax
    ) -> TupleExprElementSyntax {
        TupleExprElementSyntax(
            label: label,
            expression: expression
        )
    }

    static func makeGenericParameter(
        attributes: [Syntax] = [],
        name: TokenSyntax,
        inheritedType: TypeSyntax? = nil
    ) -> GenericParameterSyntax {
        GenericParameterSyntax(
            attributes: attributes,
            name: name,
            inheritedType: inheritedType
        )
    }

    static func makeFunctionParameter(
        attributes: [Syntax] = [],
        name: FunctionParameterNameGroupSyntax? = nil,
        type: FunctionParameterTypeGroupSyntax? = nil,
        defaultArgument: InitializerClauseSyntax? = nil
    ) -> FunctionParameterSyntax {
        FunctionParameterSyntax(
            attributes: attributes,
            name: name,
            type: type,
            defaultArgument: defaultArgument
        )
    }

    static func makePatternBinding(
        pattern: PatternSyntax,
        type: TypeSyntax? = nil,
        initializerValue: ExprSyntax? = nil,
        accessor: AccessorSyntaxProtocol? = nil
    ) -> PatternBindingSyntax {
        PatternBindingSyntax(
            pattern: pattern,
            type: type,
            initializerValue: initializerValue,
            accessor: accessor
        )
    }

    static func makeClosureCaptureItem(
        specifier: TokenListSyntax? = nil,
        name: TokenSyntax? = nil,
        expression: ExprSyntax
    ) -> ClosureCaptureItemSyntax {
        ClosureCaptureItemSyntax(
            specifier: specifier,
            name: name,
            expression: expression
        )
    }

    static func makeEnumCaseElement(
        identifier: TokenSyntax,
        associatedValues: [FunctionParameterSyntax] = [],
        rawValue: ExprSyntax? = nil
    ) -> EnumCaseElementSyntax {
        EnumCaseElementSyntax(
            identifier: identifier,
            associatedValues: associatedValues,
            rawValue: rawValue
        )
    }
}
