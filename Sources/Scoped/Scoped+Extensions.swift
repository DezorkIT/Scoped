import Foundation

extension Optional: Scoped {}

// MARK: - NS extensions
extension NSObject: Scoped {}

// MARK: CG extensions
extension CGPoint: Scoped {}
extension CGRect: Scoped {}
extension CGSize: Scoped {}
extension CGVector: Scoped {}
extension CGAffineTransform: Scoped {}
