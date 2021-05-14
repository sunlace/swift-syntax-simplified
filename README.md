# SwiftSyntaxSimplified

SwiftSyntax without the boilerplate.

## Setup

### Choose a version

This library uses a compound version number, with two parts separated by a dash `-`.
- The first part is a standard three-part semantic version number `X.Y.Z`.
- The second part is the version of SwiftSyntax that it is compatible with.

For example: `1.0.1-0.50300.0` is the `1.0.1` version compatible with the `0.503000.0` version of SwiftSyntax.

### Add as a Swift Package Manager dependency

Update your `Package.swift`, replacing `<version number>` with the version you chose above.

```swift
Package(
    ...,
    dependencies: [
        ...,
        .package(
            name: "SwiftSyntaxSimplified",
            url: "https://github.com/Sunlace/swift-syntax-simplified.git",
            .exact("<version number>")
        ),
    ],
    targets: [
        ...,
        .target(
            ...,
            dependencies: [
                ...,
                .product(name: "SwiftSyntaxSimplified", package: "SwiftSyntaxSimplified"),
            ]
        ),
    ]
)
```

### Import in your code

This library does not replace all the functionality of `SwiftSyntax`, so do not remove your existing imports of `SwiftSyntax`.

```swift
import SwiftSyntax
import SwiftSyntaxSimplified
```

## Usage

### Convert easily between typed and type-erased objects

SwiftSyntax has both typed and type-erased views of all Syntax objects, used throughout its API. With SwiftSyntaxSimplified, you can convert between them on demand.

For example, many of the `SyntaxVisitor` APIs pass typed arguments but expect type-erased return values: 

```swift
override func visit(_ node: IfStmtSyntax) -> StmtSyntax {
    return node.withConditions(<conditions>).typeErased
}
```

Other APIs return type-erased values that must be converted to typed before anything useful can be done:

```swift
override func visit(_ node: OptionalChainingExprSyntax) -> ExprSyntax {
    switch node.expression.typed {
    case let stringLiteral as StringLiteralExprSyntax: <action>
    case let functionCall as FunctionCallExprSyntax: <action>
    ...
    }
}
```

### Use the simplified factory methods

SwiftSyntax defines extremely verbose factory methods for creating syntax objects. With SwiftSyntaxSimplified, you can call the same methods that you would normally call, but with less boilerplate.

**This:**

```swift
SyntaxFactory.Simplified.makeFunctionCallExpr(
    calledExpression: <expression>,
    arguments: [
        SyntaxFactory.Simplified.makeTupleExprElement(
            expression:<expression>
        ),
        SyntaxFactory.Simplified.makeTupleExprElement(
            label: <token>,
            expression: <expression>
        ),
    ]
)
```

**Instead of this:**

```swift
SyntaxFactory.makeFunctionCallExpr(
    calledExpression: <expression>,
    leftParen: SyntaxFactory.makeLeftParenToken(),
    argumentList: SyntaxFactory.makeTupleExprElementList([
        SyntaxFactory.makeTupleExprElement(
            label: nil,
            colon: nil,
            expression: <expression>,
            trailingComma: SyntaxFactory.makeCommaToken()
        ),
        SyntaxFactory.makeTupleExprElement(
            label: <token>,
            colon: SyntaxFactory.makeColonToken(),
            expression: <expression>,
            trailingComma: nil
        )
    ]),
    rightParen: SyntaxFactory.makeRightParenToken(),
    trailingClosure: nil,
    additionalTrailingClosures: nil
)
```

## Factory Method Simplifications

This library duplicates `SyntaxFactory.make<X>(...)` methods as `SyntaxFactory.Simplified.make<X>(...)`

For each duplicated method, it applies the following interface simplifications, in order. If no simplifications can be made, the method is not duplicated.

### Steps
1. If a method contains an `Optional<TokenSyntax>` parameter named `trailing<X>` that must always be a specific token or `nil`, depending on the position of the returned object in a list object (i.e. whether it is the last item in that list)
    - remove the parameter
    - duplicate the object definition `<X>Syntax` as `SyntaxFactory.Simplified.<X>Syntax`, with fields matching the `SyntaxFactory.Simplified.make<X>(...)` parameters (including all modifications)
    - return an instance of `SyntaxFactory.Simplified.<X>Syntax` instead of `<X>Syntax`.
1. If a parameter is an `Array<X>` where `X` is a type that was duplicated in an above step
    - replace the parameter type `Array<X>` with `Array<SyntaxFactory.Simplified.X>`
1. If a parameter is a `TokenSyntax` and must always be a specific token
    - remove the parameter
1. If a parameter is an `Optional<TokenSyntax>` and must always be a specific token or `nil`:
    - replace the `Optional<TokenSyntax>` parameter type with `Bool`
    - prepend `include` to the parameter name
    - specify a default value of `false`
1. If a parameter is a `TokenSyntax` and must always be one of a specific set of tokens
    - create a `<X>Token` enum to represent the options
    - replace the `TokenSyntax` parameter type with `<X>Token>`
1. If a parameter is a `Optional<TokenSyntax>` and must always be one of a specific set of tokens or `nil`
    - create a `<X>Token` enum to represent the non-`nil` options
    - replace the `Optional<TokenSyntax>` parameter type with `Optional<<X>Token>`
1. If a parameter is an `Optional`
    - specify a default value of `nil`
1. If a parameter is an `Array`
    - specify a default value of `[]`
1. If a parameter is of a type that has a `SyntaxFactory.Simplified.make<X>(...)` method which, after modifications, has zero parameters:
    - remove the parameter
1. If a parameter is of a type that has a `SyntaxFactory.Simplified.make<X>(...)` method which, after modifications, has one parameter:
    - replace the parameter type with the parameter type of the `SyntaxFactory.Simplified.make<X>(...)` method
    - append the parameter name of the `SyntaxFactory.Simplified.make<X>(...)` method to the parameter name
1. If an object may be constructed in two different ways that both result in valid Swift
    - add a new parameter `<Z>` of type `Bool` where `true` corresponds to the more verbose option
    - specify a default value of `false`
1. If a parameter must be a specific value if another parameter of type `Optional<Y>` is `nil`:
    - remove the parameter
    - create a new model object `SyntaxFactory.Simplified.<Z>GroupSyntax`
    - create a new `SyntaxFactory.Simplified.make<Z>Group(...)` method with:
        - a copy of the parameter
        - a copy of the other parameter, but with the non-`Optional` type `<Y>`
    - replace the other parameter's parameter type `Optional<Y>` with `Optional<SyntaxFactory.Simplified.<Z>GroupSyntax>`

## Contributing

This library is incomplete, and contributions are welcome! We are actively reviewing PRs, and will merge any that:
- adds new methods making the improvements described in the Philosphy section
- fixes issues in the existing code

If you have ideas for other improvements, please open an issue or a PR. However, consistency across the API is our top concern, so any architectural changes should include equivalent changes to all existing code and, if appropriate, a new major version number.
