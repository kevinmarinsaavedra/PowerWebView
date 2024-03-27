//
//  Repository.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import Foundation

class RepositoryApp {
    let localDataSource = LocalDataSource()
    let remoteDataSource = RemoteDataSource()
    
    func downloadAndSaveFile(remoteUrl: URL, localDestinationUrlToSave: URL) async throws {
        let data = try await remoteDataSource.downloadFile(url: remoteUrl)
        try await localDataSource.saveFile(data, localDestinationUrlToSave)
    }
}
