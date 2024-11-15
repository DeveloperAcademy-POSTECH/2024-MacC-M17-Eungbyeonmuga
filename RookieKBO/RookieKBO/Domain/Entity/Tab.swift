//
//  Tab.swift
//  RookieKBO
//
//  Created by Simmons on 11/7/24.
//

import Foundation

enum Tab: Identifiable, CaseIterable {
    case match
    case highlight
    case user
    
    /// ID를 생성합니다.
    var id: UUID {
        return .init()
    }
    
    /// 탭바의 타이틀을 반환합니다.
    var title: String {
        switch self {
        case .match: return "경기 일정"
        case .highlight: return "하이라이트"
        case .user: return "마이 페이지"
        }
    }
    
    /// 탭바의 아이콘을 반환합니다.
    var defaultIcon: String {
        switch self {
        case .match: return "defaultHome"
        case .highlight: return "defaultPlayBox"
        case .user:  return "defaultUser"
        }
    }
    
    var selectedIcon: String {
        switch self {
        case .match: return "SelectedHome"
        case .highlight: return "SelectedPlayBox"
        case .user:  return "SelectedUser"
        }
    }
}
