//
//  Config.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let tempURL = "TEMP_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist 찾지 못함")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            print("Config.baseURL 오류: BASE_URL 키를 찾을 수 없음")
            return "기본 URL" 
        }
        return key
    }()
    
    static let tempURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.tempURL] as? String else {
            print("Config.tempURL 오류: tempURL 키를 찾을 수 없음")
            return "tempURL"
        }
        return key
    }()
}
