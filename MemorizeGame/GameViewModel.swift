//
//  GameViewModel.swift
//  MemorizeGame
//
//  Created by A.f. Adib on 10/24/23.
//

import SwiftUI



class GameViewModel : ObservableObject {
    
    private static let emojiss = ["👻","🎃", "🤡", "👿", "🤖", "👽","🤠", "👾","👹"]
    
   
    private static func createMemoeyGame() -> GameModel<String> {
        
      return  GameModel(noOfcards: 10) { pairIndex in
      
          if emojiss.indices.contains(pairIndex) {
              
              return emojiss[pairIndex]
          }
          else {
              return "⁉️"
          }
      }
       
    }
    
        
    @Published private var model = createMemoeyGame()
    
    
    func shuffle () {
        model.shuffle()
    }
        
    
    var cards : [GameModel<String>.Card]{
        return model.cards
    }
    
    func choose(_ card: GameModel<String>.Card) {
        model.choose(card)
    }
}
