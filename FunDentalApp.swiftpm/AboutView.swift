//
//  AboutView.swift
//  FunDentalApp
//
//  Created by Bhavya Bhatia on 20/02/2025.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("About FunDentalApp")
                .font(.largeTitle)
                .padding(.bottom, 10)
            
            Text("This app provides fun dental tips and good habits to keep your teeth healthy. Watch short videos, answer fun questions, and earn rewards that you can claim at the clinic!")
            
            // Disclaimer text added here
            Text("Disclaimer: Each YouTube video is the property of its respective owner.")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
