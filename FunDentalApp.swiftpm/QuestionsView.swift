//
//  QuestionsView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedAnswerIndex: Int? = nil
    @State private var showIncorrectAlert: Bool = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                if appState.watchedVideos.contains(appState.currentVideoIndex) && !appState.answeredQuestions.contains(appState.currentVideoIndex) {
                    // Display the question for the current video
                    let question = appState.questions[appState.currentVideoIndex]
                    
                    Text(question.text)
                        .font(.headline)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    ForEach(0..<question.options.count, id: \.self) { index in
                        Button(action: {
                            selectedAnswerIndex = index
                        }) {
                            HStack {
                                Text(question.options[index])
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Spacer()
                                if selectedAnswerIndex == index {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                    
                    Button("Submit Answer") {
                        guard let selected = selectedAnswerIndex else { return }
                        if selected == question.correctIndex {
                            // Correct answer: mark question as answered and trigger reward selection
                            appState.answeredQuestions.insert(question.id)
                            appState.showRewardBoxSelection = true
                        } else {
                            // Incorrect answer: show alert
                            showIncorrectAlert = true
                        }
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .alert(isPresented: $showIncorrectAlert) {
                        Alert(title: Text("Incorrect"), message: Text("Please try again."), dismissButton: .default(Text("OK")))
                    }
                } else {
                    Text("No question unlocked yet. Please watch the video first.")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Questions")
            .sheet(isPresented: $appState.showRewardBoxSelection, onDismiss: {
                // Reset selection when the reward modal is dismissed
                selectedAnswerIndex = nil
            }) {
                RewardBoxSelectionView()
                    .environmentObject(appState)
            }
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView().environmentObject(AppState())
    }
}
