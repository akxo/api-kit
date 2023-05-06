# apikit
networking framework for making api calls

## installation
### swift package manager (spm)
to install apikit using [swift package manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the url for the apikit repo:

1. in xcode, select “file” → “add packages...”
1. enter https://github.com/akxo/apikit

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/akxo/apikit")
```
## usage
import the module
```swift
import APIKit
```
there are 3 methods for making network requests depending on your preference:
1. completion handler
2. combine
3. async/await

### completion handler
```swift
func load<T>(resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void)
```
### combine
```swift
func load<T>(resource: Resource<T>) -> AnyPublisher<T, Error>
```
### async/await
```swift
func load<T>(resource: Resource<T>) async -> Result<T, Error>
```
