//
//  NetworkError.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import Foundation

enum NetworkingError: Error {
    case response
    case data(description: String)
    case parse
}
