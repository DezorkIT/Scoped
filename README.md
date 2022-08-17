# Scoped

Swift library inspired by [Kotlin scope functions](https://kotlinlang.org/docs/scope-functions.html)

# Usage

`Scoped` already conforms to `NSObject` and some other types. You can find them [here](https://github.com/DezorkIT/Scoped/blob/main/Sources/Scoped/Scoped%2BExtensions.swift)
```swift
let imageView = UIImageView().also {
                    $0.image = UIImage(systemName: "iphone")
                    $0.contentMode = .scaleAspectFill
                }
```

To use `Scoped` with your type you need to make an extension

```swift
extension Person: Scoped {}
let adam = Person("adam").apply {
                $0.age = 32
                $0.city = "London"
            }
```

You can also just use `with` function with any type

```swift
let anyType = with(AnyType()) {
            $0.value = "value"
        }
```
# Installation

1. Select File menu > Add Packages...
2. Enter "https://github.com/DezorkIT/Scoped" into the package repository URL text field
