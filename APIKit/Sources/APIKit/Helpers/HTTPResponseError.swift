//
//  HTTPResponseError.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

enum HTTPResponseError: Int, Error {
  case badRequest = 400
  case unauthorized = 401
  case notFound = 404
  case methodNotAllowed = 405
  case internalServerError = 500
  case notImplemented = 501
  case serviceUnavailable = 503
}
