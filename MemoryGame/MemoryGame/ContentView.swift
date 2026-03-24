//
//  ContentView.swift
//  MemoryGame
//
//  Created by Nishan Narain on 3/23/26.
//

import SwiftUI

struct ContentView: View {
    
    struct Card: Identifiable {
        let id = UUID()
        let symbol: String
        var isFaceUp = false
        var isMatched = false
    }
    
    let allSymbols = ["🍎", "🍌", "🍇", "🍒", "🍉", "🍍", "🥝", "🍓"]
    
    @State private var numberOfPairs = 4
    @State private var cards: [Card] = []
    @State private var firstSelectedIndex: Int? = nil
    @State private var secondSelectedIndex: Int? = nil
    @State private var isCheckingMatch = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Memory Game")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Picker("Number of Pairs", selection: $numberOfPairs) {
                Text("2 Pairs").tag(2)
                Text("4 Pairs").tag(4)
                Text("6 Pairs").tag(6)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .onChange(of: numberOfPairs) {
                resetGame()
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(cards.indices, id: \.self) { index in
                        if !cards[index].isMatched {
                            cardView(for: index)
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.clear)
                                .frame(height: 100)
                        }
                    }
                }
                .padding()
            }
            
            Button("Reset Game") {
                resetGame()
            }
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding(.top)
        .onAppear {
            resetGame()
        }
    }
    
    func cardView(for index: Int) -> some View {
        Button {
            handleCardTap(at: index)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(cards[index].isFaceUp ? Color.white : Color.orange)
                    .frame(height: 100)
                    .shadow(radius: 3)
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(height: 100)
                
                if cards[index].isFaceUp {
                    Text(cards[index].symbol)
                        .font(.system(size: 40))
                } else {
                    Text("?")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
        .disabled(cards[index].isFaceUp || isCheckingMatch)
    }
    
    func handleCardTap(at index: Int) {
        guard !cards[index].isFaceUp, !cards[index].isMatched else { return }
        
        cards[index].isFaceUp = true
        
        if firstSelectedIndex == nil {
            firstSelectedIndex = index
        } else if secondSelectedIndex == nil {
            secondSelectedIndex = index
            checkForMatch()
        }
    }
    
    func checkForMatch() {
        guard let first = firstSelectedIndex, let second = secondSelectedIndex else { return }
        
        isCheckingMatch = true
        
        if cards[first].symbol == cards[second].symbol {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                cards[first].isMatched = true
                cards[second].isMatched = true
                firstSelectedIndex = nil
                secondSelectedIndex = nil
                isCheckingMatch = false
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                cards[first].isFaceUp = false
                cards[second].isFaceUp = false
                firstSelectedIndex = nil
                secondSelectedIndex = nil
                isCheckingMatch = false
            }
        }
    }
    
    func resetGame() {
        var selectedSymbols = Array(allSymbols.prefix(numberOfPairs))
        selectedSymbols.append(contentsOf: selectedSymbols)
        selectedSymbols.shuffle()
        
        cards = selectedSymbols.map { Card(symbol: $0) }
        firstSelectedIndex = nil
        secondSelectedIndex = nil
        isCheckingMatch = false
    }
}

#Preview {
    ContentView()
}
