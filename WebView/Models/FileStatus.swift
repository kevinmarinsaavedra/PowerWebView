//
//  FileStatus.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import Foundation

enum FileStatus {
    case unableDirectory
    case fileExists
    case saved
    case notSaved
    
    var description: String {
        switch self {
        case .unableDirectory:
            return "It's not be possible access the directory"
        case .fileExists:
            return "the file already exists"
        case .saved:
            return "file saved"
        case .notSaved:
            return "file not saved"
        }
    }
}
