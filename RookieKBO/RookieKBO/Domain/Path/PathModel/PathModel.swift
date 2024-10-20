//
//  PathModel.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import SwiftUI

@Observable
final class PathModel: PathModelProtocol {
    
    var path: NavigationPath = NavigationPath()
    
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
}

