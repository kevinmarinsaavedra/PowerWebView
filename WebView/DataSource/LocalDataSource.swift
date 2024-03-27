//
//  LocalDataSource.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import Foundation

class LocalDataSource {
    func saveFile(_ data: Data, _ destinationUrl: URL)  async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation ) in
            DispatchQueue.main.async {
                do {
                    try data.write(to: destinationUrl, options: [.atomic])
                    continuation.resume()
                } catch let error {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
