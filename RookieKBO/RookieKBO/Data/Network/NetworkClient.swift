//
//  NetworkClient.swift
//  RookieKBO
//
//  Created by Simmons on 10/16/24.
//

import Foundation

final class NetworkClient: HTTPMethod {
    
    static let shared = NetworkClient()
    private init() {}
    
    /// StatusCode 성공 범위
    private let successStatusCodeRange = 200...299
    
    /// GET 메서드 (쿼리로 데이터 전달)
    func get<T: Decodable>(url: URL) async -> Result<T, Error> {
        return await request(url: url, method: .get)
    }
    
    /// POST 메서드 (Authorization)
    func post<T: Decodable, U: Encodable>(url: URL, body: U) async -> Result<T, Error> {
        do {
            let encodedBody = try JSONEncoder().encode(body)
            return await request(url: url, method: .post, body: encodedBody)
        } catch {
            return .failure(NetworkError.encodingError)
        }
    }
    
    /// PATCH 메서드
    func patch<T: Decodable, U: Encodable>(url: URL, body: U) async -> Result<T, Error> {
        do {
            let encodedBody = try JSONEncoder().encode(body)
            return await request(url: url, method: .patch, body: encodedBody)
        } catch {
            return .failure(NetworkError.encodingError)
        }
    }
    
    /// DELETE 메서드
    func delete<T: Decodable>(url: URL) async -> Result<T, Error> {
        return await request(url: url, method: .delete)
    }
}

// MARK: - Helper

extension NetworkClient {
    
    private enum HTTPMethodList: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    private enum HTTPHeader {
        static let mimeTypeHeader = "Content-Type"
        static let mimeTypeValue = "application/json"
    }
    
    /// StatusCode를 반환합니다.
    private func statusCode(to response: URLResponse) -> Int? {
        (response as? HTTPURLResponse)?.statusCode
    }
    
    /// URL을 URLRequest 타입으로 반환합니다.
    private func urlToRequest(_ httpMethodList: HTTPMethodList, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethodList.rawValue
        
        request.setValue(
            HTTPHeader.mimeTypeValue,
            forHTTPHeaderField: HTTPHeader.mimeTypeHeader
        )
        
        return request
    }
    
    /// 네트워크 요청을 보내고 응답을 처리합니다.
    private func request<T: Decodable>(url: URL, method: HTTPMethodList, body: Data? = nil) async -> Result<T, Error> {
        do {
            var request = urlToRequest(method, url: url)
            if let body = body {
                request.httpBody = body
            }
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let statusCode = statusCode(to: response) else {
                return .failure(NetworkError.httpResponseError)
            }
            
            guard successStatusCodeRange.contains(statusCode) else {
                let error = NetworkError.serverError(statusCode: statusCode)
                NetworkLog.failure(url: url, statusCode: statusCode, error: error)
                return .failure(error)
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                NetworkLog.success(url: url, statusCode: statusCode, data: decodedData)
                return .success(decodedData)
            } catch {
                NetworkLog.failure(url: url, statusCode: statusCode, error: error)
                return .failure(NetworkError.decodingError)
            }
        } catch {
            if let urlError = error as? URLError {
                NetworkLog.failure(url: url, statusCode: 999, error: error)
                return .failure(NetworkError.urlError(urlError))
            } else {
                NetworkLog.failure(url: url, statusCode: 999, error: error)
                return .failure(NetworkError.error(error))
            }
        }
    }
}
