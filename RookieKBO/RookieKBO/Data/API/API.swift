//
//  API.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

/// API를 추상화하는 프로토콜
protocol API {
    static var baseUrl: URL { get }
}

/// API 열거형
enum APIs {
    enum RookieKBO {
        static let baseURL = URL(string: Config.baseURL)!
        static let tempUrl = URL(string: Config.tempURL)!
    }
}
