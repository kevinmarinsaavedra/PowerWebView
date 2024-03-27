//
//  FileManager.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import SwiftUI
import WebKit

class FileManagerApp {
    func createFileName(fileExtension: String = ".pdf") -> String {
        // Generate a unique file name based on the current date and time
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let timestamp = formatter.string(from: Date())
        
        // Create the file name with the extension
        let fileName = "documents-\(timestamp)\(fileExtension)"
        
        return fileName
    }

    func getDirectoryFile(fileName: String) -> URL? {
        // Obtiene el directorio de documentos de la aplicación
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("The document directory could not be accessed.")
            return nil
        }
        
        // Ruta completa del archivo en el directorio de documentos
        let destinationUrl = documentsDirectory.appendingPathComponent(fileName)
        
        guard !fileExists(destinationUrl.path) else {
            return nil
        }
        
        return destinationUrl
    }
    
    func fileExists(_ path: String) -> Bool {
        if FileManager().fileExists(atPath: path) {
            print("File already exists")
            return true
        }
        
        return false
    }
}
