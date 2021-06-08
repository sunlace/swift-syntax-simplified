import SwiftSyntax

public struct FunctionParameterNameGroupSyntax {
    let firstName: TokenSyntax,
        secondName: TokenSyntax?
}

public struct FunctionParameterTypeGroupSyntax {
    let type: TypeSyntax,
        includeEllipsis: Bool
}

public struct TrailingClosureGroupSyntax {
    let trailingClosure: ClosureExprSyntax,
        additionalTrailingClosures: [MultipleTrailingClosureElementSyntax],
        includeEmptyArgumentListParentheses: Bool
}

public extension SyntaxFactory.Simplified {

    static func makeFunctionParameterNameGroup(
        firstName: TokenSyntax,
        secondName: TokenSyntax? = nil
    ) -> FunctionParameterNameGroupSyntax {
        FunctionParameterNameGroupSyntax(
            firstName: firstName,
            secondName: secondName
        )
    }

    static func makeFunctionParameterTypeGroup(
        type: TypeSyntax,
        includeEllipsis: Bool = false
    ) -> FunctionParameterTypeGroupSyntax {
        FunctionParameterTypeGroupSyntax(
            type: type,
            includeEllipsis: includeEllipsis
        )
    }

    static func makeTrailingClosureGroup(
        trailingClosure: ClosureExprSyntax,
        additionalTrailingClosures: [MultipleTrailingClosureElementSyntax] = [],
        includeEmptyArgumentListParentheses: Bool = false
    ) -> TrailingClosureGroupSyntax {
        TrailingClosureGroupSyntax(
            trailingClosure: trailingClosure,
            additionalTrailingClosures: additionalTrailingClosures,
            includeEmptyArgumentListParentheses: includeEmptyArgumentListParentheses
        )
    }
}
