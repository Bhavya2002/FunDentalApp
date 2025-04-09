//
//  MainTab.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            VideoSectionView()
                .tabItem {
                    Image(systemName: "video")
                    Text("Videos")
                }
            QuestionsView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Questions")
                }
            RewardsView()
                .tabItem {
                    Image(systemName: "gift")
                    Text("Rewards")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(AppState())
    }
}

