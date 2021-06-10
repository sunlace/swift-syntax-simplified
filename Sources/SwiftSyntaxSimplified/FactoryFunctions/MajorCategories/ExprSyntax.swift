import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeArrayExpr(
        elements: [ExprSyntax] = []
    ) -> ArrayExprSyntax {
        SyntaxFactory.makeArrayExpr(
            leftSquare: SimpleTokenSyntax.squareBracket(.left).token,
            elements: makeArrayElementList(elements),
            rightSquare: SimpleTokenSyntax.squareBracket(.right).token
        )
    }

    static func makeAsExpr(
        questionOrExclamationMark: QuestionOrExclamationMarkTokenSyntax? = nil,
        typeName: TypeSyntax
    ) -> AsExprSyntax {
        SyntaxFactory.makeAsExpr(
            asTok: KeywordTokenSyntax.as.token,
            questionOrExclamationMark: questionOrExclamationMark.map { $0.token },
            typeName: typeName
        )
    }

    static func makeAssignmentExpr() -> AssignmentExprSyntax {
        SyntaxFactory.makeAssignmentExpr(
            assignToken: SimpleTokenSyntax.equal.token
        )
    }

    static func makeClosureExpr(
        signature: ClosureSignatureSyntax? = nil,
        statements: [Syntax] = []
    ) -> ClosureExprSyntax {
        SyntaxFactory.makeClosureExpr(
            leftBrace: SimpleTokenSyntax.brace(.left).token,
            signature: signature,
            statements: makeCodeBlockItemList(statements),
            rightBrace: SimpleTokenSyntax.brace(.right).token
        )
    }

    static func makeFunctionCallExpr(
        calledExpression: ExprSyntax,
        arguments: [TupleExprElementSyntax] = [],
        trailingClosure: TrailingClosureGroupSyntax? = nil
    ) -> FunctionCallExprSyntax {
        let skipArgumentList = arguments.isEmpty
            && !(trailingClosure?.includeEmptyArgumentListParentheses ?? true)

        return SyntaxFactory.makeFunctionCallExpr(
            calledExpression: calledExpression,
            leftParen: skipArgumentList ? nil : SimpleTokenSyntax.paren(.left).token,
            argumentList: makeTupleExprElementList(arguments),
            rightParen: skipArgumentList ? nil : SimpleTokenSyntax.paren(.right).token,
            trailingClosure: trailingClosure?.trailingClosure,
            additionalTrailingClosures: trailingClosure?.additionalTrailingClosures.onlyIfNotEmpty.map {
                makeMultipleTrailingClosureElementList($0)
            }
        )
    }

    static func makeDictionaryExpr(
        elements: [DictionaryElementSyntax] = []
    ) -> DictionaryExprSyntax {
        SyntaxFactory.makeDictionaryExpr(
            leftSquare: SimpleTokenSyntax.squareBracket(.left).token,
            content: elements.onlyIfNotEmpty.map { makeDictionaryElementList($0) }?.typeErased
                ?? SimpleTokenSyntax.colon.token.typeErased,
            rightSquare: SimpleTokenSyntax.squareBracket(.right).token
        )
    }

    static func makeIdentifierExpr(
        identifier: TokenSyntax,
        declNameArgumentNames: [TokenSyntax] = []
    ) -> IdentifierExprSyntax {
        SyntaxFactory.makeIdentifierExpr(
            identifier: identifier,
            declNameArguments: declNameArgumentNames.onlyIfNotEmpty.map { makeDeclNameArguments(argumentNames: $0)
            }
        )
    }

    static func makeMemberAccessExpr(
        base: ExprSyntax? = nil,
        name: TokenSyntax,
        declNameArgumentNames: [TokenSyntax] = []
    ) -> MemberAccessExprSyntax {
        SyntaxFactory.makeMemberAccessExpr(
            base: base,
            dot: SimpleTokenSyntax.period.token,
            name: name,
            declNameArguments: declNameArgumentNames.onlyIfNotEmpty.map { makeDeclNameArguments(argumentNames: $0)
            }
        )
    }

    static func makeSequenceExpr(
        elements: [ExprSyntax]
    ) -> SequenceExprSyntax {
        SyntaxFactory.makeSequenceExpr(
            elements: makeExprList(elements)
        )
    }

    static func makeTupleExpr(
        elements: [TupleExprElementSyntax] = []
    ) -> TupleExprSyntax {
        SyntaxFactory.makeTupleExpr(
            leftParen: SimpleTokenSyntax.paren(.left).token,
            elementList: makeTupleExprElementList(elements),
            rightParen: SimpleTokenSyntax.paren(.right).token
        )
    }
}
