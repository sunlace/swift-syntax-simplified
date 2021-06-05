import SwiftSyntax

public protocol AccessorSyntaxProtocol: SyntaxProtocol {}

extension CodeBlockSyntax: AccessorSyntaxProtocol {}
extension AccessorBlockSyntax: AccessorSyntaxProtocol {}
