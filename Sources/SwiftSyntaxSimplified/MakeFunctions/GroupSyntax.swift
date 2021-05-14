import SwiftSyntax

public struct TrailingClosureGroupSyntax {
    let trailingClosure: ClosureExprSyntax,
        additionalTrailingClosures: [MultipleTrailingClosureElementSyntax],
        includeEmptyArgumentListParentheses: Bool
}

public struct FunctionParameterTypeGroupSyntax {
    let type: TypeSyntax,
        ellipsis: TokenSyntax?
}

public extension SyntaxFactory.Simplified {

    static func makeFunctionParameterTypeGroup(
        type: TypeSyntax,
        ellipsis: TokenSyntax? = nil
    ) -> FunctionParameterTypeGroupSyntax {
        FunctionParameterTypeGroupSyntax(
            type: type,
            ellipsis: ellipsis
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
