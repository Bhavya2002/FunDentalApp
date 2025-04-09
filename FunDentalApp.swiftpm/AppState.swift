//
//  AppState.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct Video: Identifiable {
    let id: Int
    let youtubeId: String
    let title: String
}

struct Question: Identifiable {
    let id: Int
    let text: String
    let options: [String]
    let correctIndex: Int
}

class AppState: ObservableObject {
    @Published var currentVideoIndex: Int {
        didSet { saveState() }
    }
    @Published var watchedVideos: Set<Int> {
        didSet { saveState() }
    }
    @Published var answeredQuestions: Set<Int> {
        didSet { saveState() }
    }
    @Published var rewards: [String] {
        didSet { saveState() }
    }
    @Published var showRewardBoxSelection: Bool = false

    let rewardOptions = ["Cartoon Toothbrush", "Bouncy Ball", "Baby Toothpaste", "Stationery Kit", "Stuffed Toy"]

    let videos: [Video] = [
            Video(id: 0, youtubeId: "_R6Hp8uBcOM", title: "Dental Tip 1"),
            Video(id: 1, youtubeId: "O4wDITXrvrc", title: "Dental Tip 2"),
            Video(id: 2, youtubeId: "UewfeRZlwMI", title: "Dental Tip 3"),
            Video(id: 3, youtubeId: "elf3iUs93FI", title: "Dental Tip 4"),
            Video(id: 4, youtubeId: "ajI6_CMPxp0", title: "Dental Tip 5"),
            Video(id: 5, youtubeId: "Lf_b1x3zZzc", title: "Dental Tip 6")
        ]
        
        let questions: [Question] = [
            Question(id: 0, text: "Why should you brush your teeth?", options: ["Because we love toothpaste", "To get rid of plaque", "We shouldn't! It's not important!"], correctIndex: 1),
            Question(id: 1, text: "For how long should you brush your teeth?", options: ["1 minute", "2 minutes", "5 minutes"], correctIndex: 1),
            Question(id: 2, text: "Is too much sugar bad for your teeth?", options: ["Yes, sugar causes tooth decay", "No, eating sugar makes your teeth white", "No, eating sugar gives you energy"], correctIndex: 0),
            Question(id: 3, text: "What to do if your gums bleed?", options: ["Rinse with water", "Eat ice cream", "Floss"], correctIndex: 2),
            Question(id: 4, text: "What parts of the mouth should you clean when brushing?", options: ["Teeth only", "Tongue only", "Teeth and Tongue"], correctIndex: 2),
            Question(id: 5, text: "What would happen if you don't brush regularly?", options: ["Cavities can form", "Get more time to play games", "You will not have bad breath"], correctIndex: 0)
        ]

    init() {
        let defaults = UserDefaults.standard
        self.currentVideoIndex = defaults.integer(forKey: "currentVideoIndex")
        if let watched = defaults.array(forKey: "watchedVideos") as? [Int] {
            self.watchedVideos = Set(watched)
        } else {
            self.watchedVideos = []
        }
        if let answered = defaults.array(forKey: "answeredQuestions") as? [Int] {
            self.answeredQuestions = Set(answered)
        } else {
            self.answeredQuestions = []
        }
        self.rewards = defaults.stringArray(forKey: "rewards") ?? []
    }

    private func saveState() {
        let defaults = UserDefaults.standard
        defaults.set(self.currentVideoIndex, forKey: "currentVideoIndex")
        defaults.set(Array(self.watchedVideos), forKey: "watchedVideos")
        defaults.set(Array(self.answeredQuestions), forKey: "answeredQuestions")
        defaults.set(self.rewards, forKey: "rewards")
    }
}
