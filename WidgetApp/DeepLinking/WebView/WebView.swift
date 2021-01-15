//
//  WebView.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 13.01.2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: URL?
    @Binding var reload: Bool
    
    private let urls = [URL(string: "https://google.com/")!, URL(string: "https://bing.com")!]
    private let webview = WKWebView()
    
    fileprivate func loadRequest(in webView: WKWebView) {
        if let url = url {
            webview.load(URLRequest(url: url))
        } else {
            let index = Int(Date().timeIntervalSince1970) % 2
            webview.load(URLRequest(url: urls[index]))
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        loadRequest(in: webview)
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        if reload {
            loadRequest(in: uiView)
            DispatchQueue.main.async {
                self.reload = false
            }
        }
    }
}
