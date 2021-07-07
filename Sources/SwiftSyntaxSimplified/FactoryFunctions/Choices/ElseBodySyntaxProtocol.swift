import SwiftSyntax

public protocol ElseBodySyntaxProtocol: SyntaxProtocol {}

extension CodeBlockSyntax: ElseBodySyntaxProtocol {}
extension IfStmtSyntax: ElseBodySyntaxProtocol {}
