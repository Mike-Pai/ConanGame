//
//  ContentView.swift
//  ConanGame
//
//  Created by 白謹瑜 on 2021/3/22.
//

import SwiftUI

var unoCards = [
    cards(card: "b0", cardColor: 1, cardNumber: 0),
    cards(card: "b1", cardColor: 1, cardNumber: 1),
    cards(card: "b2", cardColor: 1, cardNumber:2),
    cards(card: "b3", cardColor: 1, cardNumber: 3),
    cards(card: "b4", cardColor: 1, cardNumber: 4),
    cards(card: "b5", cardColor: 1, cardNumber: 5),
    cards(card: "b6", cardColor: 1, cardNumber: 6),
    cards(card: "b7", cardColor: 1, cardNumber: 7),
    cards(card: "b8", cardColor: 1, cardNumber: 8),
    cards(card: "b9", cardColor: 1, cardNumber: 9),
    cards(card: "bPlus2", cardColor: 1, cardNumber: 10),
    cards(card: "bReturn", cardColor: 1, cardNumber: 11),
    cards(card: "bP", cardColor: 1, cardNumber: 12),
    cards(card: "b1", cardColor: 1, cardNumber: 1),
    cards(card: "b2", cardColor: 1, cardNumber:2),
    cards(card: "b3", cardColor: 1, cardNumber: 3),
    cards(card: "b4", cardColor: 1, cardNumber: 4),
    cards(card: "b5", cardColor: 1, cardNumber: 5),
    cards(card: "b6", cardColor: 1, cardNumber: 6),
    cards(card: "b7", cardColor: 1, cardNumber: 7),
    cards(card: "b8", cardColor: 1, cardNumber: 8),
    cards(card: "b9", cardColor: 1, cardNumber: 9),
    cards(card: "bPlus2", cardColor: 1, cardNumber: 10),
    cards(card: "bReturn", cardColor: 1, cardNumber: 11),
    cards(card: "bP", cardColor: 1, cardNumber: 12),
    
    cards(card: "g0", cardColor: 2, cardNumber: 0),
    cards(card: "g1", cardColor: 2, cardNumber: 1),
    cards(card: "g2", cardColor: 2, cardNumber:2),
    cards(card: "g3", cardColor: 2, cardNumber: 3),
    cards(card: "g4", cardColor: 2, cardNumber: 4),
    cards(card: "g5", cardColor: 2, cardNumber: 5),
    cards(card: "g6", cardColor: 2, cardNumber: 6),
    cards(card: "g7", cardColor: 2, cardNumber: 7),
    cards(card: "g8", cardColor: 2, cardNumber: 8),
    cards(card: "g9", cardColor: 2, cardNumber: 9),
    cards(card: "gPlus2", cardColor: 2, cardNumber: 10),
    cards(card: "gReturn", cardColor: 2, cardNumber: 11),
    cards(card: "gP", cardColor: 2, cardNumber: 12),
    cards(card: "g1", cardColor: 2, cardNumber: 1),
    cards(card: "g2", cardColor: 2, cardNumber:2),
    cards(card: "g3", cardColor: 2, cardNumber: 3),
    cards(card: "g4", cardColor: 2, cardNumber: 4),
    cards(card: "g5", cardColor: 2, cardNumber: 5),
    cards(card: "g6", cardColor: 2, cardNumber: 6),
    cards(card: "g7", cardColor: 2, cardNumber: 7),
    cards(card: "g8", cardColor: 2, cardNumber: 8),
    cards(card: "g9", cardColor: 2, cardNumber: 9),
    cards(card: "gPlus2", cardColor: 2, cardNumber: 10),
    cards(card: "gReturn", cardColor: 2, cardNumber: 11),
    cards(card: "gP", cardColor: 2, cardNumber: 12),

    cards(card: "red0", cardColor: 3, cardNumber: 0),
    cards(card: "red1", cardColor: 3, cardNumber: 1),
    cards(card: "red2", cardColor: 3, cardNumber:2),
    cards(card: "red3", cardColor: 3, cardNumber: 3),
    cards(card: "red4", cardColor: 3, cardNumber: 4),
    cards(card: "red5", cardColor: 3, cardNumber: 5),
    cards(card: "red6", cardColor: 3, cardNumber: 6),
    cards(card: "red7", cardColor: 3, cardNumber: 7),
    cards(card: "red8", cardColor: 3, cardNumber: 8),
    cards(card: "red9", cardColor: 3, cardNumber: 9),
    cards(card: "redPlus2", cardColor: 3, cardNumber: 10),
    cards(card: "redReturn", cardColor: 3, cardNumber: 11),
    cards(card: "redP", cardColor: 3, cardNumber: 12),
    cards(card: "red1", cardColor: 3, cardNumber: 1),
    cards(card: "red2", cardColor: 3, cardNumber:2),
    cards(card: "red3", cardColor: 3, cardNumber: 3),
    cards(card: "red4", cardColor: 3, cardNumber: 4),
    cards(card: "red5", cardColor: 3, cardNumber: 5),
    cards(card: "red6", cardColor: 3, cardNumber: 6),
    cards(card: "red7", cardColor: 3, cardNumber: 7),
    cards(card: "red8", cardColor: 3, cardNumber: 8),
    cards(card: "red9", cardColor: 3, cardNumber: 9),
    cards(card: "redPlus2", cardColor: 3, cardNumber: 10),
    cards(card: "redReturn", cardColor: 3, cardNumber: 11),
    cards(card: "redP", cardColor: 3, cardNumber: 12),

    cards(card: "y0", cardColor: 4, cardNumber: 0),
    cards(card: "y1", cardColor: 4, cardNumber: 1),
    cards(card: "y2", cardColor: 4, cardNumber:2),
    cards(card: "y3", cardColor: 4, cardNumber: 3),
    cards(card: "y4", cardColor: 4, cardNumber: 4),
    cards(card: "y5", cardColor: 4, cardNumber: 5),
    cards(card: "y6", cardColor: 4, cardNumber: 6),
    cards(card: "y7", cardColor: 4, cardNumber: 7),
    cards(card: "y8", cardColor: 4, cardNumber: 8),
    cards(card: "y9", cardColor: 4, cardNumber: 9),
    cards(card: "yPlus2", cardColor: 4, cardNumber: 10),
    cards(card: "yReturn", cardColor: 4, cardNumber: 11),
    cards(card: "yP", cardColor: 4, cardNumber: 12),
    cards(card: "y1", cardColor: 4, cardNumber: 1),
    cards(card: "y2", cardColor: 4, cardNumber:2),
    cards(card: "y3", cardColor: 4, cardNumber: 3),
    cards(card: "y4", cardColor: 4, cardNumber: 4),
    cards(card: "y5", cardColor: 4, cardNumber: 5),
    cards(card: "y6", cardColor: 4, cardNumber: 6),
    cards(card: "y7", cardColor: 4, cardNumber: 7),
    cards(card: "y8", cardColor: 4, cardNumber: 8),
    cards(card: "y9", cardColor: 4, cardNumber: 9),
    cards(card: "yPlus2", cardColor: 4, cardNumber: 10),
    cards(card: "yReturn", cardColor: 4, cardNumber: 11),
    cards(card: "yP", cardColor: 4, cardNumber: 12),
    
    cards(card: "Wild", cardColor: 5, cardNumber: 13),
    cards(card: "Wilddrawfour", cardColor: 6, cardNumber: 14),
    cards(card: "Wild", cardColor: 5, cardNumber: 13),
    cards(card: "Wilddrawfour", cardColor: 6, cardNumber: 14),
    cards(card: "Wild", cardColor: 5, cardNumber: 13),
    cards(card: "Wilddrawfour", cardColor: 6, cardNumber: 14),
    cards(card: "Wild", cardColor: 5, cardNumber: 13),
    cards(card: "Wilddrawfour", cardColor: 6, cardNumber: 14),

    
]

struct ContentView: View {
    @State private var opacity:Double = 0
    @State var playerNumber:Int = 2
    @State private var showEditorplayer = false
    @State private var bargainChip = 50
    @AppStorage("bargainChip") var bargainChipStore:Int=0
    @State private var showGameView = false
    @State private var showPrimary = true
    @State private var cardsOpacity:Double = 0
    
    var body: some View {
        VStack{
            if showPrimary == true{
                VStack {
                    Spacer()
                    VStack {
                        VStack{
                            HStack {
                                Image("Uno")
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                        }
                        .padding(.bottom, 120)
                        
                        HStack {
                            HStack {
                                Image("籌碼")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                                Text("\(bargainChip)")
                                    .foregroundColor(.black)
                                
                                Button(action: {
                                    bargainChip = bargainChip + 10
                                    bargainChipStore=bargainChip
                                }) {
                                    Image(systemName: "plus.circle")
                                        .frame(width: 25, height: 25)
                                }
                                
                            }
                            .background(Capsule().foregroundColor(.yellow))
                            
                        }
                        
                        HStack {
                            Button(action: {
                                bargainChip = bargainChip-50
                                bargainChipStore = bargainChip
                                showPrimary = false
                                showGameView = true
                                
                            }) {
                                Text("進入遊戲")
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                            .padding(.all, 10.0)
                            .background(
                                Capsule()
                                    .foregroundColor(.red)
                            )
                            Link(destination: URL(string: "https://www.mgz.com.tw/pages/10043")!, label: {
                                Text("規則說明")
                                    .padding(.all, 10.0)
                                    .foregroundColor(.white)
                                    .font(.title)
                            })
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )
                        }
                        .padding(.top)
                        
                    }
                    
                    
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("卡面主題")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding(.all, 10.0)
                        .background(Capsule().foregroundColor(.blue))
                        VStack {
                            Button(action: {
                                showEditorplayer = true
                            }) {
                                Text("玩家人數")
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                            .padding(.all, 10.0)
                            .background(Capsule().foregroundColor(.blue))
                            if showEditorplayer == true {
                                HStack {
                                    Button(action: {
                                        if playerNumber != 2{
                                            playerNumber = playerNumber - 1
                                        }
                                    }) {
                                        Image(systemName: "minus.circle")
                                            .foregroundColor(.blue)
                                    }
                                    Text("\(playerNumber)人")
                                    Button(action: {
                                        if playerNumber != 4{
                                            playerNumber = playerNumber + 1
                                        }
                                    }) {
                                        Image(systemName: "plus.circle")
                                        
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }else if showGameView == true{
                
                UnoGameView(showPrimary: $showPrimary, playerNumber:playerNumber)
                
            }
            
        }
        .background(
            Image("背景圖")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .onAppear{
            unoCards.shuffle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
