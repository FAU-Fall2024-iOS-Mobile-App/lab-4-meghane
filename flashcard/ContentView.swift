//
//  ContentView.swift
//  flashcard
//
//  Created by meghan on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.cyan.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)
            VStack(spacing: 20) {
                // Card text
                Text("Question")
                        .bold()
                // Separator
                Rectangle()
                    .frame(height: 1)
                Text("Located at the southern end of Puget Sound, what is the capitol of Washington?")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding(30)
        }
        .frame(width: 300, height: 500)
    }
}
#Preview {
    ContentView()
}
