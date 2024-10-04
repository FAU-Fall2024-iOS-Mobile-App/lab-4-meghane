//
//  CardView.swift
//  flashcard
//
//  Created by meghan on 10/3/24.
//

import SwiftUI

struct CardView: View {
   
    let card: Card
    var onSwipedLeft: (() -> Void)? // <-- Add closures to be called when user swipes left or right
    var onSwipedRight: (() -> Void)? // <--
    
    @State private var isShowingQuestion = true
    @State private var offset: CGSize = .zero // <-- A state property to store the offset
    private let swipeThreshold: Double = 200 // <--- Define a swipeThreshold constant top level

    var body: some View {
        ZStack {
            // Back-most card background
                RoundedRectangle(cornerRadius: 25.0) // <-- Add another card background behind the original
                    .fill(offset.width < 0 ? .red : .green) // <-- Set fill based on offset (swipe left vs right)

                // Front-most card background (i.e. original background)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(isShowingQuestion ? Color.cyan.gradient : Color.yellow.gradient)
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    .opacity(1 - abs(offset.width) / swipeThreshold)
            VStack(spacing: 20) {
                // Card text
                // Card type (question vs answer)
                Text(isShowingQuestion ? "Question" : "Answer")
                    .bold()
                // Separator
                Rectangle()
                    .frame(height: 1)
                Text(isShowingQuestion ? card.question : card.answer)
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding(30)
        }
        .frame(width: 300, height: 500)
        .onTapGesture {
            isShowingQuestion.toggle()
        }
        .rotationEffect(.degrees(offset.width / 20.0)) // <-- Add rotation when swiping
        .offset(CGSize(width: offset.width, height: 0))
        .gesture(DragGesture()
            .onChanged { gesture in
                let translation = gesture.translation
                 print(translation)
                offset = translation
            }.onEnded { gesture in  // <-- onEnded called when gesture ends

                if gesture.translation.width > swipeThreshold { // <-- Compare the gesture ended translation value to the swipeThreshold
                    print("👉 Swiped right")
                    onSwipedRight?() // <-- Call swiped right closure

                } else if gesture.translation.width < -swipeThreshold {
                    print("👈 Swiped left")
                    onSwipedLeft?() // <-- Call swiped left closure

                } else {
                    print("🚫 Swipe canceled")
                    withAnimation(.bouncy) { // <-- Make updates to state managed property with animation
                        offset = .zero
                    }
                }
            }
        )
    }
    
}
// Card data model
struct Card:Equatable {
    let question: String
    let answer: String
    
    static let mockedCards = [
            Card(question: "What is the most popular cat breed in the United States?", answer: "The Domestic Shorthair"),
            Card(question: "What percentage of a cat's life is spent sleeping?", answer: "About 70%"),
            Card(question: "What is a group of cats called?", answer: "A 'Clowder.'"),
            Card(question: "Why do cats knead with their paws?", answer: "To show comfort and affection"),
            Card(question: "How high can cats jump?", answer: "Up to six times their body length")
        ]
}


#Preview {
    CardView(card: Card(
            question: "What is the most popular cat breed in the United States?",
            answer: "The Domestic Shorthair"))
    
}

