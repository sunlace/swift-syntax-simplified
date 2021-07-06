import SwiftSyntax

public protocol ElseBodySyntax: SyntaxProtocol {}

extension CodeBlockSyntax: ElseBodySyntax {}
extension IfStmtSyntax: ElseBodySyntax {}
