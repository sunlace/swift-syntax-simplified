import SwiftSyntax

extension SyntaxFactory.Simplified {

    public static func makeGenericWhereClause(
        requirementBodies: [Syntax]
    ) -> GenericWhereClauseSyntax {
        SyntaxFactory.makeGenericWhereClause(
            whereKeyword: SyntaxFactory.makeWhereKeyword(),
            requirementList: makeGenericRequirementList(requirementBodies)
        )
    }

    public static func makeParameterClause(
        parameters: [FunctionParameterSyntax]
    ) -> ParameterClauseSyntax {

        SyntaxFactory.makeParameterClause(
            leftParen: SyntaxFactory.makeLeftParenToken(),
            parameterList: makeFunctionParameterList(parameters),
            rightParen: SyntaxFactory.makeRightParenToken()
        )
    }

    public static func makeGenericParameterClause(
        genericParameters: [GenericParameterSyntax]
    ) -> GenericParameterClauseSyntax {
        SyntaxFactory.makeGenericParameterClause(
            leftAngleBracket: SyntaxFactory.makeLeftAngleToken(),
            genericParameterList: makeGenericParameterList(genericParameters),
            rightAngleBracket: SyntaxFactory.makeRightAngleToken()
        )
    }

    public static func makeGenericArgumentClause(
        argumentTypes: [TypeSyntax]
    ) -> GenericArgumentClauseSyntax {
        SyntaxFactory.makeGenericArgumentClause(
            leftAngleBracket: SyntaxFactory.makeLeftAngleToken(),
            arguments: makeGenericArgumentList(argumentTypes),
            rightAngleBracket: SyntaxFactory.makeRightAngleToken()
        )
    }
}
