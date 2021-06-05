import SwiftSyntax

public protocol LabelSyntaxProtocol: SyntaxProtocol {}

extension SwitchCaseLabelSyntax: LabelSyntaxProtocol {}
extension SwitchDefaultLabelSyntax: LabelSyntaxProtocol {}
