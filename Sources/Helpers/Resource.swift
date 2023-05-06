//
//  Resource.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

public struct Resource<T> where T: Decodable {
  public typealias HTTPHeaders = [String: String]
  
  let path: URLPath
  let method: HTTPMethod
  var headers: HTTPHeaders
  var params: [String : Any]
  let decode: (Data) throws -> T
  
  public init(jsonDecoder: JSONDecoder,
       path: String,
       method: HTTPMethod,
       params: [String : Any],
       headers: HTTPHeaders = [:]) {
    var newHeaders = headers
    newHeaders["Accept"] = "application/json"
    newHeaders["Content-Type"] = "application/json"
    
    self.path = URLPath(path)
    self.method = method
    self.params = params
    self.headers = newHeaders
    
    self.decode = {
      if let empty = Empty() as? T {
        return empty
      } else {
        return try jsonDecoder.decode(T.self, from: $0)
      }
    }
  }
}
