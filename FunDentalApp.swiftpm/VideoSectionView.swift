//
//  VideoSectionView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct VideoSectionView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appState.videos) { video in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(video.title)
                            .font(.headline)
                        
                        if video.id <= appState.currentVideoIndex {
                            // Unlocked video: show embedded video
                            VideoView(VideoID: video.youtubeId)
                                .frame(height: 200)
                                .cornerRadius(8)
                            
                            if !appState.watchedVideos.contains(video.id) {
                                Button("Mark as Watched") {
                                    appState.watchedVideos.insert(video.id)
                                }
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            } else {
                                Text("Watched")
                                    .foregroundColor(.green)
                            }
                        } else {
                            // Locked video: show placeholder with lock icon
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(height: 200)
                                    .cornerRadius(8)
                                Image(systemName: "lock.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Videos")
        }
    }
}

struct VideoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        VideoSectionView().environmentObject(AppState())
    }
}

