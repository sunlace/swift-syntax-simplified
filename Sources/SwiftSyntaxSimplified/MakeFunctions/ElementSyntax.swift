import SwiftSyntax

public struct TupleExprElementSyntax {
    let label: TokenSyntax?,
        expression: ExprSyntax
}

public struct FunctionParameterSyntax {
    let attributes: [Syntax],
        firstName: TokenSyntax?,
        secondName: TokenSyntax?,
        type: FunctionParameterTypeGroupSyntax?,
        defaultArgument: InitializerClauseSyntax?
}

public struct GenericParameterSyntax {
    let attributes: [Syntax],
        name: TokenSyntax,
        inheritedType: TypeSyntax?
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
        firstName: TokenSyntax? = nil, // TODO: One of these must be required, right?
        secondName: TokenSyntax? = nil,
        type: FunctionParameterTypeGroupSyntax? = nil,
        defaultArgument: InitializerClauseSyntax? = nil
    ) -> FunctionParameterSyntax {
        FunctionParameterSyntax(
            attributes: attributes,
            firstName: firstName,
            secondName: secondName,
            type: type,
            defaultArgument: defaultArgument
        )
    }
}
