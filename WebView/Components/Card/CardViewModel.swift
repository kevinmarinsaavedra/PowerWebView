//
//  CardViewModel.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import SwiftUI



class CardViewModel: ObservableObject {
    @Published var description: String
    @Published var type: CardType

    init(description: String = "", type: CardType) {
        self.description = description
        self.type = type
    }
}

extension CardViewModel {
    enum CardType: String {
        case normal, success, error
        
        func cardBackgroundColor() -> Color {
            switch self {
            case .normal:
                return Color.white
            case .success:
                return Color.green
            case .error:
                return Color.red
            }
        }

        func titleColor() -> Color {
            switch self {
            case .normal:
                return Color.black
            default:
                return Color.white
            }
        }
    }
}
