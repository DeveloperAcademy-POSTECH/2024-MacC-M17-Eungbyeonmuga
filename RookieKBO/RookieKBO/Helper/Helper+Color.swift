//
//  Helper+Color.swift
//  RookieKBO
//
//  Created by Simmons on 10/9/24.
//

import SwiftUI

typealias Background = Color.Background
typealias Brand = Color.Brand
typealias GrayScale = Color.GrayScale
typealias TextLabel = Color.TextLabel

extension Color {
    
    enum Background {
        static let first = Color(.first)
    }
    
    enum Brand {
        static let primary1 = Color(.primary1)
        static let primary2 = Color(.primary2)
    }
    
    enum GrayScale {
        static let stroke = Color(.stroke)
        static let unselectBackground = Color(.unselectBackground)
    }
    
    enum TextLabel {
        static let main = Color(.main)
        static let sub1 = Color(.sub1)
    }
    
}
