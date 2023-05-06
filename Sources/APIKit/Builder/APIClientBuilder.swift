//
//  APIClientBuilder.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

final class APIClientBuilder: ClientBuilder {
  private let baseUrl: String
  
  init(baseUrl: String) {
    self.baseUrl = baseUrl
  }
  
  func build() -> Client {
    return APIClient(baseUrl: baseUrl)
  }
}
