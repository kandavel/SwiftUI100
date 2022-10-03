//
//  Rock&Scissors.swift
//  100Days
//
//  Created by kandavel on 28/09/22.
//

import SwiftUI

struct Rock_Scissors: View {
    @State  var v1  = 0
    @State var list  = ["🪨","📃","✂️"]
    @State var computerRandom : Int = Int.random(in: 0..<3)
    @State var randomBool  =  Bool.random()
    @State var questionCount  =  0
    @State var isShowResult  = false
    @State var score  = 0
    var body: some View {
        VStack {
            HStack {
                Text("Computer has Played").foregroundColor(Color.indigo).foregroundStyle(.ultraThickMaterial).font(.system(size: 50))
            }
            HStack {
                Text(list[computerRandom]).font(.system(size: 200))
            }
            HStack {
                ForEach(0..<list.count) {(index) in
                    Button(list[index]) {
                        tapAction(index: index)
                    }.font(.system(size: 80)).foregroundColor(Color.accentColor).foregroundStyle(.ultraThickMaterial)
                    Spacer()
                }
            }
        }.alert("Game over", isPresented: $isShowResult) {
            Button("Play Again", action: reset)
        } message: {
            Text("Your score was \(score)")
        }
    }
    
    func  tapAction(index : Int) {
        let winningMoves  = [1,2,0]
        let isWin : Bool
           
        isWin =  index == winningMoves[computerRandom]
        if isWin {
            questionCount  = questionCount + 1
            score  = score  + 1
        }
        
        if questionCount == 2 {
            isShowResult = true
        }
        else {
            computerRandom  = Int.random(in: 0..<3)
        }
    }
    
    func reset() {
        questionCount = 0
        isShowResult = false
    }
}

struct Rock_Scissors_Previews: PreviewProvider {
    static var previews: some View {
        Rock_Scissors()
    }
}
