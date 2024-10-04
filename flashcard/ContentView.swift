//
//  ContentView.swift
//  flashcard
//
//  Created by meghan on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = Card.mockedCards
    var body: some View {
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(card: cards[index])
                    .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
                CardView(card: cards[index], onSwipedLeft: { // <-- Add swiped left property
                    cards.remove(at: index) // <-- Remove the card from the cards array
                }, onSwipedRight: { // <-- Add swiped right property
                    cards.remove(at: index) // <-- Remove the card from the cards array
                })
            }
        }
        .frame(width: 300, height: 500)
        .animation(.bouncy, value: cards)
    }
}


#Preview {
    ContentView()
}
