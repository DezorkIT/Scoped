public protocol Scoped {}

public extension Scoped where Self: Any {

    @inlinable
    func apply(_ block: (inout Self) throws -> Void) rethrows -> Self {
       var copy = self
       try block(&copy)
       return copy
    }

    @inlinable
    func `let`<R>(_ block: (Self) throws -> R) rethrows -> R {
        try block(self)
    }

    @inlinable
    func also(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}
