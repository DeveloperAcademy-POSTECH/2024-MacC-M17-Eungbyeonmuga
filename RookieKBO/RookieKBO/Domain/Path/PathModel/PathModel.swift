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
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path = .init()
    }
}

