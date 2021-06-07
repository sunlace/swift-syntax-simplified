import SwiftSyntax

public protocol ClosureSignatureInputSyntaxProtocol: SyntaxProtocol {}

extension ParameterClauseSyntax: ClosureSignatureInputSyntaxProtocol {}
extension ClosureParamListSyntax: ClosureSignatureInputSyntaxProtocol {}
