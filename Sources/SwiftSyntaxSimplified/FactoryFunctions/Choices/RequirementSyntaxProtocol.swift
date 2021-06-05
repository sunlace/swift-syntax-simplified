import SwiftSyntax

public protocol RequirementSyntaxProtocol: SyntaxProtocol {}

extension ConformanceRequirementSyntax: RequirementSyntaxProtocol {}
extension SameTypeRequirementSyntax: RequirementSyntaxProtocol {}
