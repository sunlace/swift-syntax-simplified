import SwiftSyntax

extension SyntaxFactory.Simplified {

    // MARK: Models

    public struct TrailingClosureGroupSyntax {
        let trailingClosure: ClosureExprSyntax,
            additionalTrailingClosures: [MultipleTrailingClosureElementSyntax],
            includeEmptyArgumentListParentheses: Bool
    }

    public struct FunctionParameterTypeGroupSyntax {
        let type: TypeSyntax,
            ellipsis: TokenSyntax?
    }

    // MARK: Make Functions

    public static func makeFunctionParameterTypeGroup(
        type: TypeSyntax,
        ellipsis: TokenSyntax?
    ) -> FunctionParameterTypeGroupSyntax {
        FunctionParameterTypeGroupSyntax(
            type: type,
            ellipsis: ellipsis
        )
    }

    public static func makeTrailingClosureGroup(
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
