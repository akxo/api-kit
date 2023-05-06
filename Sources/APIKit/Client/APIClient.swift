//
//  APIClient.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Combine
import Foundation

final class APIClient: Client {
  let baseUrl: String
  
  init(baseUrl: String) {
    self.baseUrl = baseUrl
  }
  
  func load<T>(resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void) {
    let request = URLRequest(baseUrl: baseUrl, resource: resource)
    
    URLSession.shared.dataTask(with: request) { [weak self] data, response, _ in
      guard let self else { return completion(.failure(APIError.unknown)) }
      guard let data else { return completion(.failure(APIError.noData)) }
      
      do {
        completion(.success(try resource.decode(try self.parseResponse(data, response))))
      } catch {
        completion(.failure(error))
      }
    }
  }
  
  func load<T>(resource: Resource<T>) -> AnyPublisher<T, Error> {
    let request = URLRequest(baseUrl: baseUrl, resource: resource)
    
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap(parseResponse)
      .tryMap(resource.decode)
      .eraseToAnyPublisher()
  }
  
  func load<T>(resource: Resource<T>) async -> Result<T, Error> {
    let request = URLRequest(baseUrl: baseUrl, resource: resource)
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      return .success(try resource.decode(try parseResponse(data, response)))
    } catch {
      return .failure(error)
    }
  }
  
  private func parseResponse(_ data: Data, _ response: URLResponse?) throws -> Data {
    guard let httpResonse = response as? HTTPURLResponse else { throw APIError.badResponse }
    if 200..<300 ~= httpResonse.statusCode { return data }
    throw HTTPResponseError(rawValue: httpResonse.statusCode) ?? APIError.unknown
  }
}
