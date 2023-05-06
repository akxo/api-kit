//
//  URLPath.swift
//  APIKit
//
//  Created by ak on 2/25/22.
//

import Foundation

public struct URLPath {
    private var components: [String]
    
    public var absolutePath: String {
        return "/" + components.joined(separator: "/")
    }
    
    init(_ path: String) {
        components = path.components(separatedBy: "/").filter { !$0.isEmpty }
    }
    
    mutating func append(path: URLPath) {
        components += path.components
    }
    
    func appending(path: URLPath) -> URLPath {
        var copy = self
        copy.append(path: path)
        return copy
    }
}
