import SwiftSyntax

// Sources:
// https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#grammar_declaration-modifier
// https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#grammar_union-style-enum
public enum DeclModifierSyntax {

    public enum UnownedDetailToken {
        case safe
        case unsafe
    }

    public enum AccessControlDetailToken {
        case set
    }

    // Type Members
    case `class`
    case `static`

    // Initializers
    case convenience
    case required

    // Protocol Members
    case optional

    // Enums & Enum Cases
    case indirect

    // Classes & Class Members
    case final

    // Class Members
    case dynamic
    case override

    // Class & Struct Members
    case lazy

    // Operators
    case prefix
    case infix
    case postfix

    // Memory Reference Counting
    case unowned(UnownedDetailToken?)
    case weak

    // Access Control
    case `private`(AccessControlDetailToken?)
    case `fileprivate`(AccessControlDetailToken?)
    case `internal`(AccessControlDetailToken?)
    case `public`(AccessControlDetailToken?)
    case open(AccessControlDetailToken?)

    // Mutating Functions
    case mutating
    case nonmutating

    var nameToken: TokenSyntax {
        switch self {

        // Type Members
        case .class: return KeywordTokenSyntax.class.token
        case .static: return KeywordTokenSyntax.static.token

        // Initializers
        case .convenience: return SyntaxFactory.makeIdentifier("convenience")
        case .required: return SyntaxFactory.makeIdentifier("required")

        // Protocol Members
        case .optional: return SyntaxFactory.makeIdentifier("optional")

        // Enums & Enum Cases
        case .indirect: return SyntaxFactory.makeIdentifier("indirect")

        // Classes & Class Members
        case .final: return SyntaxFactory.makeIdentifier("final")

        // Class Members
        case .dynamic: return SyntaxFactory.makeIdentifier("dynamic")
        case .override: return SyntaxFactory.makeIdentifier("override")

        // Class & Struct Members
        case .lazy: return SyntaxFactory.makeIdentifier("lazy")

        // Operators
        case .prefix: return SyntaxFactory.makeIdentifier("prefix")
        case .infix: return SyntaxFactory.makeIdentifier("infix")
        case .postfix: return SyntaxFactory.makeIdentifier("postfix")

        // Memory Reference Counting
        case .unowned: return SyntaxFactory.makeIdentifier("unowned")
        case .weak: return SyntaxFactory.makeIdentifier("weak")

        // Access Control
        case .private: return KeywordTokenSyntax.private.token
        case .fileprivate: return  KeywordTokenSyntax.fileprivate.token
        case .internal: return KeywordTokenSyntax.internal.token
        case .public: return  KeywordTokenSyntax.public.token
        case .open: return  KeywordTokenSyntax.open.token

        // Mutating Functions
        case .mutating: return SyntaxFactory.makeIdentifier("mutating")
        case .nonmutating: return SyntaxFactory.makeIdentifier("nonmutating")
        }
    }

    var detailToken: TokenSyntax? {
        switch self {
        case .unowned(let detail):
            switch detail {
            case .safe: return SyntaxFactory.makeIdentifier("safe")
            case .unsafe: return SyntaxFactory.makeIdentifier("unsafe")
            case nil: return nil
            }

        case .private(let detail),
             .fileprivate(let detail),
             .internal(let detail),
             .open(let detail),
             .public(let detail):
            switch detail {
            case .set: return SyntaxFactory.makeIdentifier("set")
            case nil: return nil
            }

        default: return nil
        }
    }
}

public extension SyntaxFactory.Simplified {

    static func makeDeclModifier(_ declModifier: DeclModifierSyntax
    ) -> SwiftSyntax.DeclModifierSyntax {
        let detailToken = declModifier.detailToken

        return SyntaxFactory.makeDeclModifier(
            name: declModifier.nameToken,
            detailLeftParen: detailToken.map { _ in SimpleTokenSyntax.paren(.left).token },
            detail: detailToken,
            detailRightParen: detailToken.map { _ in SimpleTokenSyntax.paren(.right).token }
        )
    }
}
