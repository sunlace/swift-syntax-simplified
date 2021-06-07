import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeCodeBlock(
        statements: [Syntax] = []
    ) -> CodeBlockSyntax {
        SyntaxFactory.makeCodeBlock(
            leftBrace: SimpleTokenSyntax.brace(.left).token,
            statements: makeCodeBlockItemList(statements),
            rightBrace: SimpleTokenSyntax.brace(.right).token
        )
    }

    static func makeAccessorBlock(
        accessors: [AccessorDeclSyntax]
    ) -> AccessorBlockSyntax {
        SyntaxFactory.makeAccessorBlock(
            leftBrace: SimpleTokenSyntax.brace(.left).token,
            accessors: makeAccessorList(accessors),
            rightBrace: SimpleTokenSyntax.brace(.right).token
        )
    }

    static func makeMemberDeclBlock(
        memberDecls: [DeclSyntax] = []
    ) -> MemberDeclBlockSyntax {
        SyntaxFactory.makeMemberDeclBlock(
            leftBrace: SimpleTokenSyntax.brace(.left).token,
            members: makeMemberDeclList(memberDecls),
            rightBrace: SimpleTokenSyntax.brace(.right).token
        )
    }
}
