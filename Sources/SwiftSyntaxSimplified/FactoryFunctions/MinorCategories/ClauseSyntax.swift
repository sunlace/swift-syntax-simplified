import SwiftSyntax

public extension SyntaxFactory.Simplified {

    // MARK: Token Pair Clauses

    static func makeGenericArgumentClause(
        argumentTypes: [TypeSyntax]
    ) -> GenericArgumentClauseSyntax {
        SyntaxFactory.makeGenericArgumentClause(
            leftAngleBracket: SimpleTokenSyntax.angle(.left).token,
            arguments: makeGenericArgumentList(argumentTypes),
            rightAngleBracket: SimpleTokenSyntax.angle(.right).token
        )
    }

    static func makeGenericParameterClause(
        genericParameters: [GenericParameterSyntax]
    ) -> GenericParameterClauseSyntax {
        SyntaxFactory.makeGenericParameterClause(
            leftAngleBracket: SimpleTokenSyntax.angle(.left).token,
            genericParameterList: makeGenericParameterList(genericParameters),
            rightAngleBracket: SimpleTokenSyntax.angle(.right).token
        )
    }

    static func makeParameterClause(
        parameters: [FunctionParameterSyntax]
    ) -> ParameterClauseSyntax {

        SyntaxFactory.makeParameterClause(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            parameterList: makeFunctionParameterList(parameters),
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }

    // MARK: Token Clauses

    static func makeInitializerClause(
        value: ExprSyntax
    ) -> InitializerClauseSyntax {
        SyntaxFactory.makeInitializerClause(
            equal: SimpleTokenSyntax.equal.token,
            value: value
        )
    }

    static func makeGenericWhereClause(
        requirementBodies: [RequirementSyntaxProtocol]
    ) -> GenericWhereClauseSyntax {
        SyntaxFactory.makeGenericWhereClause(
            whereKeyword: KeywordTokenSyntax.where.token,
            requirementList: makeGenericRequirementList(requirementBodies)
        )
    }

    static func makeReturnClause(
        returnType: TypeSyntax
    ) -> ReturnClauseSyntax {
        SyntaxFactory.makeReturnClause(
            arrow: SimpleTokenSyntax.arrow.token,
            returnType: returnType
        )
    }

    static func makeTypeInheritanceClause(
        inheritedTypes: [TypeSyntax]
    ) -> TypeInheritanceClauseSyntax {
        SyntaxFactory.makeTypeInheritanceClause(
            colon: SimpleTokenSyntax.colon.token,
            inheritedTypeCollection: makeInheritedTypeList(inheritedTypes)
        )
    }

    static func makeTypeInitializerClause(
        value: TypeSyntax
    ) -> TypeInitializerClauseSyntax {
        SyntaxFactory.makeTypeInitializerClause(
            equal: SimpleTokenSyntax.equal.token,
            value: value
        )
    }

    static func makeWhereClause(
        guardResult: ExprSyntax
    ) -> WhereClauseSyntax {
        SyntaxFactory.makeWhereClause(
            whereKeyword: KeywordTokenSyntax.where.token,
            guardResult: guardResult
        )
    }
}
