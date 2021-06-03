import SwiftSyntax

public extension SyntaxFactory.Simplified {

    // MARK: Token Pair Clauses

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

    // MARK: Token Clauses

    static func makeInitializerClause(
        value: ExprSyntax
    ) -> InitializerClauseSyntax {
        SyntaxFactory.makeInitializerClause(
            equal: SyntaxFactory.makeEqualToken(),
            value: value
        )
    }

    static func makeTypeInheritanceClause(
        inheritedTypes: [TypeSyntax]
    ) -> TypeInheritanceClauseSyntax {
        SyntaxFactory.makeTypeInheritanceClause(
            colon: SyntaxFactory.makeColonToken(),
            inheritedTypeCollection: makeInheritedTypeList(inheritedTypes)
        )
    }

    static func makeReturnClause(
        returnType: TypeSyntax
    ) -> ReturnClauseSyntax {
        SyntaxFactory.makeReturnClause(
            arrow: SyntaxFactory.makeArrowToken(),
            returnType: returnType
        )
    }

    static func makeGenericWhereClause(
        requirementBodies: [RequirementSyntaxProtocol]
    ) -> GenericWhereClauseSyntax {
        SyntaxFactory.makeGenericWhereClause(
            whereKeyword: SyntaxFactory.makeWhereKeyword(),
            requirementList: makeGenericRequirementList(requirementBodies)
        )
    }
}
