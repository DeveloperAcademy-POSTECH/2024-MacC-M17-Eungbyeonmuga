//
//  TranscriptInterface.swift
//  RookieKBO
//
//  Created by crownjoe on 11/28/24.
//

import Foundation

protocol TranscriptServiceInterface {
    func fetchTranscript(videoId: String) async -> Result<NetworkTranscript, Error>
}
