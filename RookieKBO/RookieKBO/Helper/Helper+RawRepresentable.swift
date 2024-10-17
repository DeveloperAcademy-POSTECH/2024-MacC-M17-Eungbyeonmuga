//
//  Helper+RawRepresentable.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

extension RawRepresentable where RawValue == String, Self: API {
    
    /// Base URL을 붙인 후 반환합니다.
    var url: URL {
        let url = Self.baseUrl.appendingPathComponent(rawValue)
        
        if url.absoluteString.last == "/" {
            var urlString = url.absoluteString
            urlString.removeLast()
            return URL(string: urlString)!
        }
        
        return url
    }
    
    init?(rawValue: String) { nil }
}
