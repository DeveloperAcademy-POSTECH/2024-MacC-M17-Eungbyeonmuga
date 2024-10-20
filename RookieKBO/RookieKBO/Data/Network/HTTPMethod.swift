//
//  HTTPMethod.swift
//  RookieKBO
//
//  Created by Simmons on 10/16/24.
//

import Foundation

protocol HTTPMethod {
    func get<T: Decodable>(url: URL) async -> Result<T, Error>
    func post<T: Decodable, U: Encodable>(url: URL, body: U) async -> Result<T, Error>
    func patch<T: Decodable, U: Encodable>(url: URL, body: U) async -> Result<T, Error>
    func delete<T: Decodable>(url: URL) async -> Result<T, Error>
}
