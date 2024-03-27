//
//  WebView.swift
//  WebView
//
//  Created by Kevin Marin on 24/3/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var viewModel: WebViewModel
    
    init(viewModel: WebViewModel) {
        self.viewModel = viewModel
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: viewModel.startUrl) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        fileprivate var downloadDestinationURL: URL?
        
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
                
        // MARK: - WKNavigationDelegate
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let url = webView.url?.absoluteString {
                parent.viewModel.onURLChanged(url)
            }
        }
        
        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

            if let urlBase = navigationAction.request.url, contienePDF(urlBase) {
                parent.viewModel.downloadAndSaveFile(remoteUrl: urlBase)
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
        
        // Methods
        private func contienePDF(_ url: URL) -> Bool {
            let valid = ".pdf"
            return url.absoluteString.lowercased().contains(valid)
        }
    }
}

