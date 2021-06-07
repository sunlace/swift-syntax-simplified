import SwiftSyntax

public extension SyntaxFactory.Simplified {

    static func makeAccessorList(
        _ accessorDecls: [AccessorDeclSyntax]
    ) -> AccessorListSyntax {
        SyntaxFactory.makeAccessorList(accessorDecls)
    }
    
    static func makeExprList(
        _ exprs: [ExprSyntax]
    ) -> ExprListSyntax {
        SyntaxFactory.makeExprList(exprs)
    }

    static func makeMultipleTrailingClosureElementList(
        _ elements: [MultipleTrailingClosureElementSyntax]
    ) -> MultipleTrailingClosureElementListSyntax {
        SyntaxFactory.makeMultipleTrailingClosureElementList(elements)
    }
}
