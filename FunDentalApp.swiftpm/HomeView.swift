//
//  HomeView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                // Centered app title
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Navigation buttons
                NavigationLink(destination: MainTabView().environmentObject(AppState())) {
                    Text("Start")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: AboutView()) {
                    Text("What does the app do?")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Spacer(minLength: 265)
            }
            .padding()
            .navigationTitle("FunDentalApp")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
