//
//  URLRequest+init.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

extension URLRequest {
  init<T>(baseUrl: String, resource: Resource<T>) {
    let url = URL(baseUrl: baseUrl, resource: resource)
    self.init(url: url)
    httpMethod = resource.method.rawValue
    resource.headers.forEach {
      setValue($0.value, forHTTPHeaderField: $0.key)
    }
    switch resource.method {
    case .post, .put, .delete:
      httpBody = try! JSONSerialization.data(withJSONObject: resource.params, options: [])
    default:
      break
    }
  }
}
