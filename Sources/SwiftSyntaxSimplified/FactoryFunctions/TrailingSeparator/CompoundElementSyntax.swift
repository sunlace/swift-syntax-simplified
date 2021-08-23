import SwiftSyntax

public extension TokenSyntax {
    static func identifier(_ text: String) -> Self {
        return SyntaxFactory.makeIdentifier(text)
    }
}

@resultBuilder public struct SyntaxListBuilder<Element> {
    public static func buildBlock(_ components: [Element]...) -> [Element] {
        return components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: Element) -> [Element] {
        return [expression]
    }
    public static func buildExpression(_ expression: [Element]) -> [Element] {
        return expression
    }
}

// MARK: Operators

postfix operator *

public postfix func *<T>(value: T) -> Anything<T> {
    return Anything(wrapped: value)
}

public struct Anything<T> {

    // MARK: Properties

    fileprivate let wrapped: T

    // MARK: Interface

    public func apply<U>(_ transform: (T) -> U) -> U {
        transform(wrapped)
    }

    public func run(_ codeBlock: (T) -> ()) -> T {
        codeBlock(wrapped)
        return wrapped
    }

    public func applyMutating(_ mutatingTransform: (inout T) -> Void) -> T {
        var mutableWrapped = wrapped
        mutatingTransform(&mutableWrapped)

        return mutableWrapped
    }

    public func also(_ codeBlock: () -> ()) -> T {
        codeBlock()
        return wrapped
    }
}



public struct CaseItemSyntax {
    let pattern: PatternSyntax,
        guardResult: ExprSyntax?
}

public struct ClosureCaptureItemSyntax {
    let specifier: TokenListSyntax?,
        name: TokenSyntax?,
        expression: ExprSyntax
}

public struct DictionaryElementSyntax {
    let keyExpression: ExprSyntax,
        valueExpression: ExprSyntax
}

public struct EnumCaseElementSyntax {
    let identifier: TokenSyntax,
        associatedValues: [FunctionParameterSyntax],
        rawValue: ExprSyntax?
}

public struct FunctionParameterSyntax {
    let attributes: [AttributeSyntax],
        name: FunctionParameterNameGroupSyntax?,
        type: FunctionParameterTypeGroupSyntax?,
        defaultArgument: InitializerClauseSyntax?
}

public struct GenericParameterSyntax {
    let attributes: [AttributeSyntax],
        name: TokenSyntax,
        inheritedType: TypeSyntax?
}

public struct PatternBindingSyntax {
    let pattern: PatternSyntax,
        type: TypeSyntax?,
        initializerValue: ExprSyntax?,
        accessor: AccessorSyntaxProtocol?
}

public struct TupleExprElementSyntax {
    let label: TokenSyntax?,
        expression: ExprSyntax
}

@dynamicMemberLookup
public struct TuplePatternElementSyntax {
    var rawValue: SwiftSyntax.TuplePatternElementSyntax

    public init<Pattern: PatternSyntaxProtocol>(pattern: Pattern) {
        self.rawValue = SyntaxFactory.makeTuplePatternElement(
            labelName: nil,
            labelColon: nil,
            pattern: pattern.typeErased,
            trailingComma: nil
        )
    }

    public subscript<Member>(dynamicMember dynamicMember: KeyPath<SwiftSyntax.TuplePatternElementSyntax, Member>) -> Member {
        rawValue[keyPath: dynamicMember]
    }

    /// Returns a copy of the receiver with its `labelName` replaced.
    /// - param newChild: The new `labelName` to replace the node's
    ///                   current `labelName`, if present.
    public func withLabelName(
        _ newChild: TokenSyntax?
    ) -> TuplePatternElementSyntax {
        self*.applyMutating {
            $0.rawValue = $0.rawValue
            .withLabelName(newChild)
            .withLabelColon(newChild.map { _ in SimpleTokenSyntax.colon.token })
        }
    }


    /// Returns a copy of the receiver with its `pattern` replaced.
    /// - param newChild: The new `pattern` to replace the node's
    ///                   current `pattern`, if present.
    public func withPattern(
        _ newChild: PatternSyntax?
    ) -> TuplePatternElementSyntax {
        self*.applyMutating {
            $0.rawValue = $0.rawValue.withPattern(newChild)
        }
    }
}

public struct TupleTypeElementSyntax {
    let includeInOut: Bool,
        name: FunctionParameterNameGroupSyntax?,
        type: TypeSyntax,
        includeEllipsis: Bool,
        initializerValue: ExprSyntax?
}

public extension SyntaxFactory.Simplified {

    static func makeCaseItem(
        pattern: PatternSyntax,
        guardResult: ExprSyntax? = nil
    ) -> CaseItemSyntax {
        CaseItemSyntax(
            pattern: pattern,
            guardResult: guardResult
        )
    }

    static func makeClosureCaptureItem(
        specifier: TokenListSyntax? = nil,
        name: TokenSyntax? = nil,
        expression: ExprSyntax
    ) -> ClosureCaptureItemSyntax {
        ClosureCaptureItemSyntax(
            specifier: specifier,
            name: name,
            expression: expression
        )
    }

    static func makeDictionaryElement(
        keyExpression: ExprSyntax,
        valueExpression: ExprSyntax
    ) -> DictionaryElementSyntax {
        DictionaryElementSyntax(
            keyExpression: keyExpression,
            valueExpression: valueExpression
        )
    }

    static func makeEnumCaseElement(
        identifier: TokenSyntax,
        associatedValues: [FunctionParameterSyntax] = [],
        rawValue: ExprSyntax? = nil
    ) -> EnumCaseElementSyntax {
        EnumCaseElementSyntax(
            identifier: identifier,
            associatedValues: associatedValues,
            rawValue: rawValue
        )
    }

    static func makeFunctionParameter(
        attributes: [AttributeSyntax] = [],
        name: FunctionParameterNameGroupSyntax? = nil,
        type: FunctionParameterTypeGroupSyntax? = nil,
        defaultArgument: InitializerClauseSyntax? = nil
    ) -> FunctionParameterSyntax {
        FunctionParameterSyntax(
            attributes: attributes,
            name: name,
            type: type,
            defaultArgument: defaultArgument
        )
    }

    static func makeGenericParameter(
        attributes: [AttributeSyntax] = [],
        name: TokenSyntax,
        inheritedType: TypeSyntax? = nil
    ) -> GenericParameterSyntax {
        GenericParameterSyntax(
            attributes: attributes,
            name: name,
            inheritedType: inheritedType
        )
    }

    static func makePatternBinding(
        pattern: PatternSyntax,
        type: TypeSyntax? = nil,
        initializerValue: ExprSyntax? = nil,
        accessor: AccessorSyntaxProtocol? = nil
    ) -> PatternBindingSyntax {
        PatternBindingSyntax(
            pattern: pattern,
            type: type,
            initializerValue: initializerValue,
            accessor: accessor
        )
    }

    static func makeTupleExprElement(
        label: TokenSyntax? = nil,
        expression: ExprSyntax
    ) -> TupleExprElementSyntax {
        TupleExprElementSyntax(
            label: label,
            expression: expression
        )
    }

    static func makeTupleTypeElement(
        includeInOut: Bool = false,
        name: FunctionParameterNameGroupSyntax? = nil,
        type: TypeSyntax,
        includeEllipsis: Bool = false,
        initializerValue: ExprSyntax? = nil
    ) -> TupleTypeElementSyntax {
        TupleTypeElementSyntax(
            includeInOut: includeInOut,
            name: name,
            type: type,
            includeEllipsis: includeEllipsis,
            initializerValue: initializerValue
        )
    }
}
