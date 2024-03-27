//
//  MainView.swift
//  WebView
//
//  Created by Kevin Marin on 24/3/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @StateObject var cardViewModel = CardViewModel(description: "Description", type: .normal)
    
    var body: some View {
        ZStack {
            VStack {
                if cardViewModel.type != .normal{
                    CardView(viewModel: cardViewModel)
                }

                Button(
                    action: {
                        viewModel.showWebView = true
                    },
                    label: {
                        Text(Constant.text)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: Constant.buttonHeight)
                            .background(backgroundGradiente)
                            .cornerRadius(Constant.cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                                    .stroke(Color.black, lineWidth: 3)
                            )                })
                
            }.padding()
        }.sheet(isPresented: $viewModel.showWebView) {
            WebView(viewModel: webViewModel)
        }
    }
}


// MARK: ViewModels complements
extension MainView {
    var webViewModel: WebViewModel {
        return .init(
            startUrl: viewModel.startUrl,
            onURLChanged: { newURL in
                print("URL changed: \(newURL)")
            },
            onStatusFileDownloaded: { status in
                switch status {
                case .fileExists, .notSaved, .unableDirectory:
                    self.cardViewModel.type = .error
                case .saved:
                    self.cardViewModel.type = .success
                    self.viewModel.showWebView = false
                }
                self.cardViewModel.description = status.description
            })
    }
}

// MARK: View complements
extension MainView {
    var backgroundGradiente: some View {
        return LinearGradient(
            gradient: Gradient(colors: [Color.yellow, Color.orange]),
            startPoint: .leading,
            endPoint: .trailing)
    }
}

// MARK: Constants
extension MainView {
    struct Constant {
        static let primaryColor: Color = .black
        static let text = "OPEN WebView"
        static let buttonHeight = 50.0
        static let cornerRadius = 15.0
    }
}

#Preview {
    MainView()
}
