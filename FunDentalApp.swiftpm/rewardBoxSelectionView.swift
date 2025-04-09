//
//  rewardBoxSelectionView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct RewardBoxSelectionView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Congratulations! You have earned a reward box!")
                .font(.largeTitle)
                .padding()
            
            HStack(spacing: 40) {
                Button(action: {
                    selectReward()
                }) {
                    Image(systemName: "cube.box.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.orange)
                }
                
                Button(action: {
                    selectReward()
                }) {
                    Image(systemName: "cube.box.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purple)
                }
            }
            Spacer()
        }
        .padding()
    }
    
    func selectReward() {
        // Randomly choose a reward and add it to the rewards list
        if let reward = appState.rewardOptions.randomElement() {
            appState.rewards.append(reward)
        }
        // Unlock the next video if available
        if appState.currentVideoIndex < appState.videos.count - 1 {
            appState.currentVideoIndex += 1
        }
        // Dismiss the modal
        presentationMode.wrappedValue.dismiss()
    }
}

