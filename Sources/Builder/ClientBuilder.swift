//
//  ClientBuilder.swift
//  APIKit
//
//  Created by ak on 5/5/23.
//

import Foundation

public protocol ClientBuilder: AnyObject {
  func build() -> Client
}
