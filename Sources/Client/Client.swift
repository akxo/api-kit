//
//  Client.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Combine
import Foundation

public protocol Client: AnyObject {
  var baseUrl: String { get }
  
  func load<T>(resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void)
  func load<T>(resource: Resource<T>) -> AnyPublisher<T, Error>
  func load<T>(resource: Resource<T>) async -> Result<T, Error>
}
