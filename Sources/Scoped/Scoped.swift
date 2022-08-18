public protocol Scoped {}

public extension Scoped where Self: Any {

    /// Allows you to set properties on an instance with a closure
    ///
    ///     let adam = Person("adam")
    ///     .apply {
    ///        $0.age = 32
    ///        $0.city = "London"
    ///     }
    ///     print(adam)
    ///
    /// - NOTE: it copies value types and pointers
    @discardableResult
    @inlinable
    func apply(_ block: (inout Self) throws -> Void) rethrows -> Self {
       var copy = self
       try block(&copy)
       return copy
    }

    /// Allows you to set properties on an instance with a closure. Doesn't copy anything.
    ///
    ///     let imageView = UIImageView().also {
    ///     $0.image = UIImage(systemName: "iphone")
    ///     $0.contentMode = .scaleAspectFill
    ///     }
    @discardableResult
    @inlinable
    func also(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }

    /// Allows you to execute something with a closure and returns it's result
    ///
    ///     let numbers = ["one", "two", "three", "four"]
    ///     let modifiedFirstItem = numbers.first.let { firstItem in
    ///        guard let firstItem = firstItem else { return "" }
    ///        print("The first item of the list is \(firstItem)")
    ///        return firstItem.count >= 5 ? firstItem : "!" + firstItem + "!"
    ///     }.uppercased()
    ///     print("First item after modifications: \(modifiedFirstItem)")
    @discardableResult
    @inlinable
    func `let`<R>(_ block: (Self) throws -> R) rethrows -> R {
        try block(self)
    }
    
    /// Returns self value if it satisfies the given `predicate` or `nil`, if it doesn't.
    @discardableResult
    @inlinable
    func takeIf(_ predicate: (Self) throws -> Bool) rethrows -> Self? {
        return try predicate(self) ? self : nil
    }

    /// Returns self value if it does `not` satisfy the given `predicate` or `nil`, if it does.
    @discardableResult
    @inlinable
    func takeUnless(_ predicate: (Self) throws -> Bool) rethrows -> Self? {
        return try !predicate(self) ? self : nil
    }
}

@discardableResult
@inlinable
public func with<T, R>(_ reciever: T, block: (inout T) throws -> R) rethrows -> R {
    var copy = reciever
    return try block(&copy)
}
