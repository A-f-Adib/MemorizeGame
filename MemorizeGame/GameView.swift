//
//  GameView.swift
//  MemorizeGame
//
//  Created by A.f. Adib on 10/24/23.
//

import SwiftUI

struct GameView: View {
    
   @ObservedObject var viewModel : GameViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
           
        } .padding()
    }
    
    
    var cards : some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 85))])
        {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}


struct CardView : View {
    
    let card : GameModel<String>.Card
    
    init (_ card : GameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle (cornerRadius: 10)
            
            Group {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 70))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            
            }
                .opacity(card.isFaceUP ? 1 : 0)
            shape.fill()
                .opacity(card.isFaceUP ? 0 : 1)
        }
        
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
