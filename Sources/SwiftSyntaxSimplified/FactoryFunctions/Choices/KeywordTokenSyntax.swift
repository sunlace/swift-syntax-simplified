import SwiftSyntax

enum KeywordTokenSyntax {

    case `class`
    case `struct`
    case `enum`

    case `async`
    case `static`
    case `inout`

    case `let`
    case `var`

    case `true`
    case `false`

    case `throws`
    case `rethrows`

    case `import`
    case `init`
    case `func`
    case `case`
    case `default`
    case `nil`

    case `as`
    case `is`
    case `where`
    case `in`

    case `continue`
    case `break`
    case `return`
    case `throw`

    case `if`
    case `while`
    case `switch`
    case `guard`
    case `else`

    case `open`
    case `public`
    case `internal`
    case `fileprivate`
    case `private`

    var token: TokenSyntax {
        switch self {
        case .class: return SyntaxFactory.makeClassKeyword()
        case .struct: return SyntaxFactory.makeStructKeyword()
        case .enum: return SyntaxFactory.makeEnumKeyword()

        case .async: return SyntaxFactory.makeIdentifier("async")
        case .static: return SyntaxFactory.makeStaticKeyword()
        case .inout: return SyntaxFactory.makeInoutKeyword()

        case .let: return SyntaxFactory.makeLetKeyword()
        case .var: return SyntaxFactory.makeVarKeyword()

        case .true: return SyntaxFactory.makeTrueKeyword()
        case .false: return SyntaxFactory.makeFalseKeyword()

        case .throws: return SyntaxFactory.makeThrowsKeyword()
        case .rethrows: return SyntaxFactory.makeRethrowsKeyword()

        case .import: return SyntaxFactory.makeImportKeyword()
        case .`init`: return SyntaxFactory.makeInitKeyword()
        case .func: return SyntaxFactory.makeFuncKeyword()
        case .case: return SyntaxFactory.makeCaseKeyword()
        case .default: return SyntaxFactory.makeDefaultKeyword()
        case .nil: return SyntaxFactory.makeNilKeyword()

        case .as: return SyntaxFactory.makeAsKeyword()
        case .is: return SyntaxFactory.makeIsKeyword()
        case .where: return SyntaxFactory.makeWhereKeyword()
        case .in: return SyntaxFactory.makeInKeyword()

        case .continue: return SyntaxFactory.makeContinueKeyword()
        case .break: return SyntaxFactory.makeBreakKeyword()
        case .return: return SyntaxFactory.makeReturnKeyword()
        case .throw: return SyntaxFactory.makeThrowKeyword()

        case .if: return SyntaxFactory.makeIfKeyword()
        case .while: return SyntaxFactory.makeWhileKeyword()
        case .switch: return SyntaxFactory.makeSwitchKeyword()
        case .guard: return SyntaxFactory.makeGuardKeyword()
        case .else: return SyntaxFactory.makeElseKeyword()

        case .open: return SyntaxFactory.makeIdentifier("open")
        case .public: return SyntaxFactory.makePublicKeyword()
        case .internal: return SyntaxFactory.makeInternalKeyword()
        case .fileprivate: return SyntaxFactory.makeFileprivateKeyword()
        case .private: return SyntaxFactory.makePrivateKeyword()
        }
    }
}
