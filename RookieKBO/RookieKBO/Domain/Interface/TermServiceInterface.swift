//
//  TermServiceInterface.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

protocol TermServiceInterface {
    
    func loadTranscript(from filename: String) -> VideoTranscript? 
}
