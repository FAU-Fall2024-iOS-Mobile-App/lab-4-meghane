//
//  CardView.swift
//  flashcard
//
//  Created by meghan on 10/3/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var isShowingQuestion = true
    var body: some View {
        ZStack {
            
            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isShowingQuestion ? Color.cyan.gradient : Color.yellow.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)
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
    }
    
}
// Card data model
struct Card {
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

