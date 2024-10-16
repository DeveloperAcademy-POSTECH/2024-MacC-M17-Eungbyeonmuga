//
//  NetworkError.swift
//  RookieKBO
//
//  Created by Simmons on 10/16/24.
//

import Foundation

enum NetworkError: Error {
    case httpResponseError
    case decodingError
    case encodingError
    case serverError(statusCode: Int)
    case urlError(URLError)
    case error(Error)
    case urlComponentsError

    var localizedDescription: String {
        switch self {
        case .httpResponseError:
            return "🫣 HTTP Response 값 없음"
        case .decodingError:
            return "🫣 디코딩 오류"
        case .encodingError:
            return "🫣 인코딩 오류"
        case .serverError(let statusCode):
            return "🫣 서버 오류 \(statusCode)"
        case .urlError(let urlError):
            return urlError.localizedDescription
        case .error(let error):
            return error.localizedDescription
        case .urlComponentsError:
            return "🫣 URLComponents 오류"
        }
    }
}
