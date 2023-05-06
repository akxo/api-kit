//
//  APIClientBuilder.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

public final class APIClientBuilder: ClientBuilder {
  private let baseUrl: String
  
  public init(baseUrl: String) {
    self.baseUrl = baseUrl
  }
  
  public func build() -> Client {
    return APIClient(baseUrl: baseUrl)
  }
}
