//
//  ContentView.swift
//  MemorizeGame
//
//  Created by A.f. Adib on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒"," 🚐","🛻","🚚","🚛","🚜","🏍","🛺","🚔","🚂","✈️","🚀"]
    
    @State var emoCount = 4
    
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(emojis[0..<emoCount], id: \.self) { emoji in
                        cardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                    
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            
            HStack{
                remove
                Spacer()
                add
            }
            .padding()
           
        }
        
    }
    
    
    func cardCountAdj (by offset : Int, symbol: String) -> some View {
        
        Button(action: {
            
                emoCount += offset
           
        }, label: {
            Image(systemName: symbol)
                .foregroundColor(.blue)
                .font(.largeTitle)
        })
            .disabled(emoCount + offset < 1 || emoCount + offset > emojis.count)
    }
    
    
    var remove : some View {
       cardCountAdj(by: -1, symbol: "minus.circle")
    }
    
    
    var add : some View {
      cardCountAdj(by: +1, symbol: "plus.circle")
    }
}




struct cardView : View {
    
    @State var isFaceUp : Bool = false
    
    var content : String
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle (cornerRadius: 10)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
    }
}
