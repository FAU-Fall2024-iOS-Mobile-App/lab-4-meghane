//
//  ContentView.swift
//  flashcard
//
//  Created by meghan on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = Card.mockedCards
    @State private var createCardViewPresented = false
    @State private var cardsToPractice: [Card] = [] // <-- Store cards removed from cards array
    @State private var cardsMemorized: [Card] = [] // <--
    
    var body: some View {
        ZStack {
            VStack { // <-- VStack to show buttons arranged vertically behind the cards
                   Button("Reset") { // <-- Reset button with title and action
                       cards = cardsToPractice + cardsMemorized // <-- Reset the cards array with cardsToPractice and cardsMemorized
                       cardsToPractice = [] // <-- set both cardsToPractice and cardsMemorized to empty after reset
                       cardsMemorized = [] // <--
                   }
                   .disabled(cardsToPractice.isEmpty && cardsMemorized.isEmpty)

                   Button("More Practice") { // <-- More Practice button with title and action
                       cards = cardsToPractice // <-- Reset the cards array with cardsToPractice
                       cardsToPractice = [] // <-- Set cardsToPractice to empty after reset
                   }
                   .disabled(cardsToPractice.isEmpty)
               }
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(card: cards[index])
                    .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
                CardView(card: cards[index], onSwipedLeft: {
                    let removedCard = cards.remove(at: index) // <-- Get the removed card
                    cardsToPractice.append(removedCard) // <-- Add removed card to cards to practice array
                }, onSwipedRight: {
                    let removedCard = cards.remove(at: index) // <-- Get the removed card
                    cardsMemorized.append(removedCard) // <-- Add removed card to memorized cards array
                    
                })
            }
        }
        .frame(width: 300, height: 500)
        .animation(.bouncy, value: cards)
        .sheet(isPresented: $createCardViewPresented, content: {
            CreateFlashcardView { card in
                cards.append(card)
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity) // <-- Force the ZStack frame to expand as much as possible (the whole screen in this case)
        .overlay(alignment: .topTrailing) {
            Button("Add Flashcard", systemImage: "plus") {
                createCardViewPresented.toggle()
            }
            .padding(.trailing)
        }
    }
    
}


#Preview {
    ContentView()
}
