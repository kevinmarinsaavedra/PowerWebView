//
//  WebViewModel.swift
//  WebView
//
//  Created by Kevin Marin on 24/3/24.
//

import Foundation
import UIKit

class WebViewModel: ObservableObject {
    let startUrl: String
    let onURLChanged: (String) -> Void
    let onStatusFileDownloaded: (FileStatus) -> Void
    
    //Repository
    let repositoryApp = RepositoryApp()
    let fileManagerApp = FileManagerApp()
    
    init(startUrl: String,
         onURLChanged: @escaping (String) -> Void,
         onStatusFileDownloaded: @escaping (FileStatus) -> Void) {
        self.startUrl = startUrl
        self.onURLChanged = onURLChanged
        self.onStatusFileDownloaded = onStatusFileDownloaded
    }
    
    func getLocalDestinationToSave() -> URL? {
        let fileName = fileManagerApp.createFileName()
        return fileManagerApp.getDirectoryFile(fileName: fileName)
    }
    
    func downloadAndSaveFile(remoteUrl: URL) {
        guard let localDestinationUrlToSave = getLocalDestinationToSave() else {
            onStatusFileDownloaded(.unableDirectory)
            return
        }
        
        guard !fileManagerApp.fileExists(localDestinationUrlToSave.path) else {
            onStatusFileDownloaded(.fileExists)
            return
        }
        
        Task {
            do {
                try await RepositoryApp().downloadAndSaveFile(remoteUrl: remoteUrl,
                                                              localDestinationUrlToSave: localDestinationUrlToSave)
                DispatchQueue.main.async {
                    self.onStatusFileDownloaded(.saved)
                }
            } catch {
                DispatchQueue.main.async {
                    self.onStatusFileDownloaded(.notSaved)
                }
            }
        }
    }
}
