//
//  RemoteDataSource.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import Foundation

class RemoteDataSource {
    func downloadFile(url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkingError.response
        }
        
        return data
    }
}

