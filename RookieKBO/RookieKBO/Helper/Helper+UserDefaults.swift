//
//  Helper+UserDefaults.swift
//  RookieKBO
//
//  Created by crownjoe on 10/14/24.
//

import Foundation

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.com.rookiekbo.widget.simmons"
        return UserDefaults(suiteName: appGroupId)!
    }
}
