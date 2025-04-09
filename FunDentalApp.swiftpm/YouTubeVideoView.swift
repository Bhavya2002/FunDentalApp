//
//  YouTubeVideoView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    let VideoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(VideoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}

