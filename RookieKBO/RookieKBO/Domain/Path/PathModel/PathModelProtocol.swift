//
//  PathModelProtocol.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import SwiftUI

protocol PathModelProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    
    func push(_ screen: Screen)
    func pushSheet(_ sheet: Sheet)
    func presentSheet(_ sheet: Sheet)
    func pop()
    func popToRoot()
    func dismissSheet()
}
