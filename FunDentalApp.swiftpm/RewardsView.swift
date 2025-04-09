//
//  RewardsView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct RewardsView: View {
    @EnvironmentObject var appState: AppState
    @State private var rewardToClaim: String? = nil
    @State private var showClaimAlert: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appState.rewards, id: \.self) { reward in
                    HStack {
                        Text(reward)
                        Spacer()
                        Button("Claim") {
                            rewardToClaim = reward
                            showClaimAlert = true
                        }
                        .foregroundColor(.blue)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Rewards")
            .alert(isPresented: $showClaimAlert) {
                Alert(
                    title: Text("Claim Reward"),
                    message: Text("Do you want to claim \(rewardToClaim ?? "this reward") at the clinic?"),
                    primaryButton: .default(Text("Yes"), action: {
                        // Simulate claiming the reward by removing it from the list
                        if let reward = rewardToClaim, let index = appState.rewards.firstIndex(of: reward) {
                            appState.rewards.remove(at: index)
                        }
                    }),
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView().environmentObject(AppState())
    }
}

