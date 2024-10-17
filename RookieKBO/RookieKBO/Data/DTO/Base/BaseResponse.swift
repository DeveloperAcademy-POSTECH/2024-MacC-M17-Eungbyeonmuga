//
//  BaseResponse.swift
//  RookieKBO
//
//  Created by Simmons on 10/16/24.
//

import Foundation

struct BaseResponse<ResultType: Decodable>: Decodable {
    let timeStamp: String
    let code: String
    let message: String
    let result: ResultType
}
