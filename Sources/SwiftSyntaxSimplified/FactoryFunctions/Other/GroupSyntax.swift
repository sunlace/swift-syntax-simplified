import SwiftSyntax

public struct FunctionParameterNameGroupSyntax {
    let firstName: TokenSyntax,
        secondName: TokenSyntax?
}

public struct FunctionParameterTypeGroupSyntax {
    let type: TypeSyntax,
        ellipsis: TokenSyntax?
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
