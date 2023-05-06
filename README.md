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
create the api client with your baseurl
```swift
let clientBuilder = APIClientBuilder(baseUrl: "your-base-url-here")
let client = clientBuilder.build()
```
there are 3 methods for making network requests depending on your preference:
1. completion handler
```swift
func load<T>(resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void)
```
2. combine
```swift
func load<T>(resource: Resource<T>) -> AnyPublisher<T, Error>
```
3. async/await
```swift
func load<T>(resource: Resource<T>) async -> Result<T, Error>
```
### example 1 (GET movies)
create response object (make sure it's decodable)
```swift
struct APIMovie: Decodable {
  let title: String
  let director: String
}
```
build resource
```swift
let resource = Resource<[APIMovie]>(
  jsonDecoder: JSONDecoder(),
  path: "/movies",
  method: .get,
  params: ["upcoming": true]
)
```
make the request
#### completion handler
```swift
client.load(resource: resource) { result in
  switch result {
  case let .success(movies):
    // handle movies
  case let .failure(error):
    // handle error
  }
}
```
#### combine
```swift
client.load(resource: resource)
  .sink { completion in
    switch completion {
    case .finished:
      // handle completion
    case let .failure(error):
      // handle error
    }
  } receiveValue: { movies in
    // handle movies
  }
```
#### async/await
```swift
let result = await client.load(resource: resource)
switch result {
case let .success(movies):
  // handle movies
case let .failure(error):
  // handle error
}
```
### example 2 (POST movie)
build resource
```swift
let resource = Resource<APIMovie>(
  jsonDecoder: JSONDecoder(),
  path: "/movies",
  method: .post,
  params: [
    "title": "inception",
    "director": "christopher nolan"
  ]
)
```
make the request like above
