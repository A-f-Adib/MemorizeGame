//
//  GameModel.swift
//  MemorizeGame
//
//  Created by A.f. Adib on 10/24/23.
//

import Foundation

struct GameModel<CardContent> where CardContent : Equatable {
    
    struct Card : Equatable, Identifiable {
        var id: String
        var isFaceUP = false
        var isMatched = false
        let content : CardContent
    }
    
    private (set) var cards :  [Card]
    
    
    init(noOfcards : Int, contentFactory : (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, noOfcards) {
            
            let Content = contentFactory(pairIndex)
            
            cards.append(Card(id: "\(pairIndex + 1)a", content: Content))
            cards.append(Card(id: "\(pairIndex + 1)b", content: Content))
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    
    
    
    
    var onlyFaceUpCard : Int? {
        get {
            cards.indices.filter { index in
                cards[index].isFaceUP
            }.only
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUP = (newValue == $0)
            }
        }
    }
    
    
    
    
    mutating func choose (_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUP && !cards[chosenIndex].isMatched {
                if let matchIndex = onlyFaceUpCard {
            if cards[chosenIndex].content == cards[matchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[matchIndex].isMatched = true
                    }
                }
                else {
                    onlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUP = true
            }
        }
    }
     
}

extension Array {
    var only : Element? {
        return count == 1 ? first : nil
    }
}
