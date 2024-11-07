//
//  TermServiceInterface.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

protocol TermServiceInterface {
    func printTermEntries()
    func createTermEntry(term: String)
    func deleteTermEntry(term: String)
}
