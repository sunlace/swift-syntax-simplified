import SwiftSyntax

public protocol ConditionSyntaxProtocol: SyntaxProtocol {}

extension AvailabilityConditionSyntax: ConditionSyntaxProtocol {}
extension MatchingPatternConditionSyntax: ConditionSyntaxProtocol {}
extension OptionalBindingConditionSyntax: ConditionSyntaxProtocol {}

extension ExprSyntax: ConditionSyntaxProtocol {}
