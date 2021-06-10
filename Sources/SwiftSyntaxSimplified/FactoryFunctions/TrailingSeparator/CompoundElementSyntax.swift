import SwiftSyntax

public struct CaseItemSyntax {
    let pattern: PatternSyntax,
        guardResult: ExprSyntax?
}

public struct ClosureCaptureItemSyntax {
    let specifier: TokenListSyntax?,
        name: TokenSyntax?,
        expression: ExprSyntax
}

public struct DictionaryElementSyntax {
    let keyExpression: ExprSyntax,
        valueExpression: ExprSyntax
}

public struct EnumCaseElementSyntax {
    let identifier: TokenSyntax,
        associatedValues: [FunctionParameterSyntax],
        rawValue: ExprSyntax?
}

public struct FunctionParameterSyntax {
    let attributes: [AttributeSyntax],
        name: FunctionParameterNameGroupSyntax?,
        type: FunctionParameterTypeGroupSyntax?,
        defaultArgument: InitializerClauseSyntax?
}

public struct GenericParameterSyntax {
    let attributes: [AttributeSyntax],
        name: TokenSyntax,
        inheritedType: TypeSyntax?
}

public struct PatternBindingSyntax {
    let pattern: PatternSyntax,
        type: TypeSyntax?,
        initializerValue: ExprSyntax?,
        accessor: AccessorSyntaxProtocol?
}

public struct TupleExprElementSyntax {
    let label: TokenSyntax?,
        expression: ExprSyntax
}

public struct TuplePatternElementSyntax {
    let labelName: TokenSyntax?,
        pattern: PatternSyntax
}

public struct TupleTypeElementSyntax {
    let includeInOut: Bool,
        name: FunctionParameterNameGroupSyntax?,
        type: TypeSyntax,
        includeEllipsis: Bool,
        initializerValue: ExprSyntax?
}

public extension SyntaxFactory.Simplified {

    static func makeCaseItem(
        pattern: PatternSyntax,
        guardResult: ExprSyntax?
    ) -> CaseItemSyntax {
        CaseItemSyntax(
            pattern: pattern,
            guardResult: guardResult
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

    static func makeDictionaryElement(
        keyExpression: ExprSyntax,
        valueExpression: ExprSyntax
    ) -> DictionaryElementSyntax {
        DictionaryElementSyntax(
            keyExpression: keyExpression,
            valueExpression: valueExpression
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

    static func makeFunctionParameter(
        attributes: [AttributeSyntax] = [],
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

    static func makeGenericParameter(
        attributes: [AttributeSyntax] = [],
        name: TokenSyntax,
        inheritedType: TypeSyntax? = nil
    ) -> GenericParameterSyntax {
        GenericParameterSyntax(
            attributes: attributes,
            name: name,
            inheritedType: inheritedType
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

    static func makeTupleExprElement(
        label: TokenSyntax? = nil,
        expression: ExprSyntax
    ) -> TupleExprElementSyntax {
        TupleExprElementSyntax(
            label: label,
            expression: expression
        )
    }

    static func makeTuplePatternElement(
        labelName: TokenSyntax? = nil,
        pattern: PatternSyntax
    ) -> TuplePatternElementSyntax {
        TuplePatternElementSyntax(
            labelName: labelName,
            pattern: pattern
        )
    }

    static func makeTupleTypeElement(
        includeInOut: Bool = false,
        name: FunctionParameterNameGroupSyntax? = nil,
        type: TypeSyntax,
        includeEllipsis: Bool = false,
        initializerValue: ExprSyntax? = nil
    ) -> TupleTypeElementSyntax {
        TupleTypeElementSyntax(
            includeInOut: includeInOut,
            name: name,
            type: type,
            includeEllipsis: includeEllipsis,
            initializerValue: initializerValue
        )
    }
}
