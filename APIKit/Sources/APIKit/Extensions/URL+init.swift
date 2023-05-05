//
//  URL+init.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

extension URL {
  init<T>(baseUrl: String, resource: Resource<T>) {
    var components = URLComponents(string: baseUrl)!
    let resourceComponents = URLComponents(string: resource.path.absolutePath)!
    
    components.path = URLPath(components.path).appending(path: URLPath(resourceComponents.path)).absolutePath
    components.queryItems = resourceComponents.queryItems
    
    switch resource.method {
    case .get:
      var queryItems = components.queryItems ?? []
      queryItems.append(contentsOf: resource.params.map {
        URLQueryItem(name: $0.key, value: String(describing: $0.value))
      })
      components.queryItems = queryItems
    default:
      break
    }
    
    self = components.url!
  }
}
