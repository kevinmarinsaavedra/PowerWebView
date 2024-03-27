//
//  CardView.swift
//  WebView
//
//  Created by Kevin Marin on 25/3/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel

    var body: some View {
        VStack(alignment: .center) {
            Text(viewModel.type.rawValue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(viewModel.type.titleColor())
            Text(viewModel.description)
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(viewModel.type.cardBackgroundColor())
        .cornerRadius(15)
    }
}
