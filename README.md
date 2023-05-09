# api-kit
a lightweight, flexible, and easy to use networking abstraction layer for making http requests

## installation
### swift package manager (spm)
1. in xcode, select “file” → “add packages...”
2. enter https://github.com/akxo/apikit
### cocoapods
add the pod to your podfile
```ruby
pod 'api-kit'
```
install pod
```ruby
pod install
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
