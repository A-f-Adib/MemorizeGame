//
//  GameModel.swift
//  MemorizeGame
//
//  Created by A.f. Adib on 10/24/23.
//

import Foundation

struct GameModel<CardContent> {
    
    struct Card {
        var isFaceUP = true
        var isMatched = false
        let content : CardContent
    }
    
    private (set) var cards :  [Card]
    
    
    init(noOfcards : Int, contentFactory : (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, noOfcards) {
            
            let Content = contentFactory(pairIndex)
            
            cards.append(Card(content: Content))
            cards.append(Card(content: Content))
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    
    func choose (_ card: Card){
        
    }
    
}
