//
//  PathModel.swift
//  webSocket
//
//  Created by Simmons on 10/13/24.
//

import SwiftUI

@Observable
final class PathModel: PathModelProtocol {
    
    var path: NavigationPath = NavigationPath()
    var fullScreenCover: FullScreenCover?
    
    /// path 이동
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    /// 이전 path로 이동
    func pop() {
        path.removeLast()
    }
    
    /// 최상위 뷰로 이동
    func popToRoot() {
        path = .init()
    }
    
    /// FullScreenCover로 화면 띄우기
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    /// FullScreenCover 제거
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}

