import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeGenericWhereClause(
        requirementBodies: [RequirementSyntaxProtocol]
    ) -> GenericWhereClauseSyntax {
        SyntaxFactory.makeGenericWhereClause(
            whereKeyword: SyntaxFactory.makeWhereKeyword(),
            requirementList: makeGenericRequirementList(requirementBodies)
        )
    }

    static func makeParameterClause(
        parameters: [FunctionParameterSyntax]
    ) -> ParameterClauseSyntax {

        SyntaxFactory.makeParameterClause(
            leftParen: SyntaxFactory.makeLeftParenToken(),
            parameterList: makeFunctionParameterList(parameters),
            rightParen: SyntaxFactory.makeRightParenToken()
        )
    }

    static func makeGenericParameterClause(
        genericParameters: [GenericParameterSyntax]
    ) -> GenericParameterClauseSyntax {
        SyntaxFactory.makeGenericParameterClause(
            leftAngleBracket: SyntaxFactory.makeLeftAngleToken(),
            genericParameterList: makeGenericParameterList(genericParameters),
            rightAngleBracket: SyntaxFactory.makeRightAngleToken()
        )
    }

    static func makeGenericArgumentClause(
        argumentTypes: [TypeSyntax]
    ) -> GenericArgumentClauseSyntax {
        SyntaxFactory.makeGenericArgumentClause(
            leftAngleBracket: SyntaxFactory.makeLeftAngleToken(),
            arguments: makeGenericArgumentList(argumentTypes),
            rightAngleBracket: SyntaxFactory.makeRightAngleToken()
        )
    }

    static func makeInitializerClause(
        value: ExprSyntax
    ) -> InitializerClauseSyntax {
        SyntaxFactory.makeInitializerClause(
            equal: SyntaxFactory.makeEqualToken(),
            value: value
        )
    }
}
