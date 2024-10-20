//
//  PathModelProtocol.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import Foundation

protocol PathModelProtocol: ObservableObject {
    func push(_ screen: Screen)
    func pop()
    func popToRoot()
}
