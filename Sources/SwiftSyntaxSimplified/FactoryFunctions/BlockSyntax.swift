import SwiftSyntax

public protocol AccessorSyntaxProtocol: SyntaxProtocol {}

extension CodeBlockSyntax: AccessorSyntaxProtocol {}
extension AccessorBlockSyntax: AccessorSyntaxProtocol {}

public extension SyntaxFactory.Simplified {

    static func makeCodeBlock(
        statements: [CodeBlockItemSyntax] = []
    ) -> CodeBlockSyntax {
        SyntaxFactory.makeCodeBlock(
            leftBrace: SyntaxFactory.makeLeftBraceToken(),
            statements: SyntaxFactory.makeCodeBlockItemList(statements),
            rightBrace: SyntaxFactory.makeRightBraceToken()
        )
    }

    static func makeAccessorBlock(
        accessors: [AccessorDeclSyntax]
    ) -> AccessorBlockSyntax {
        SyntaxFactory.makeAccessorBlock(
            leftBrace: SyntaxFactory.makeLeftBraceToken(),
            accessors: SyntaxFactory.makeAccessorList(accessors),
            rightBrace: SyntaxFactory.makeRightBraceToken()
        )
    }

    static func makeMemberDeclBlock(
        memberDecls: [DeclSyntax] = []
    ) -> MemberDeclBlockSyntax {
        SyntaxFactory.makeMemberDeclBlock(
            leftBrace: SyntaxFactory.makeLeftBraceToken(),
            members: makeMemberDeclList(memberDecls),
            rightBrace: SyntaxFactory.makeRightBraceToken()
        )
    }
}
