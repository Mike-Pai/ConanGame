//
//  FinishGameView.swift
//  ConanGame
//
//  Created by 白謹瑜 on 2021/4/19.
//

import SwiftUI

struct FinishGameView: View {
    @Binding var showfinishView:Bool
    @Binding var showPrimary:Bool
    @Binding var isWin:Int
    @State private var voiceSlide = 0.0
    var body: some View {
        if isWin == 1 {
            VStack {
                Spacer()
                Image("GameWin")
                    .resizable()
                    .scaledToFill()
                    .frame( height: 300)
                    .opacity(0.9)
                VStack{
                    Text("Congraduation, You Win !")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("恭喜獲得 100 點 籌碼")
                        .background(Color.yellow.opacity(0.8))
                }
                HStack {
   
                    Spacer()
                    Button(action: {
                        showPrimary = true
                        showfinishView = false
                        unoCards.shuffle()
                    }) {
                        Text("返回主頁")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )

                    }
                    Spacer()
                }

                Spacer()
            }
            .background(
                Image("背景圖")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )

        }else if isWin == 2{
            
            VStack {
                Spacer()
                Image("GameLose")
                    .resizable()
                    .scaledToFill()
                    .frame( height: 300)
                    .opacity(0.9)
                VStack{
                    Text("Oh No, 😭You Lose😭 !")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("哎呀！失去 50 點 籌碼")
                        .background(Color.yellow.opacity(0.8))
                }
                HStack {
                    Spacer()
                
                    Button(action: {
                        showPrimary = true
                        showfinishView = false
                        unoCards.shuffle()
                    }) {
                        Text("返回主頁")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )

                    }
                    Spacer()
                }

                Spacer()
            }
            .background(
                Image("背景圖")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )


        }else if isWin == 0{
            VStack {
                Spacer()
                VStack{
                    
                        Text("系統設置")
                            .font(.title)
                            .fontWeight(.heavy)
                            .background(Color.yellow.opacity(0.8))
                    HStack{
                        Label(
                            title: { Text("音效") },
                            icon: {
                                Image("Voice")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        Slider(value: $voiceSlide)
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        showPrimary = false
                        showfinishView = false
                    }) {
                        Text("繼續遊戲")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.red)
                            )

                    }
                    Spacer()
                    Button(action: {
                        showPrimary = true
                        showfinishView = false
                        unoCards.shuffle()
                    }) {
                        Text("返回主頁")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )

                    }
                    Spacer()
                }

                Spacer()
            }
            .background(
                Image("背景圖")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )

        }
        
    }
}

struct FinishGameView_Previews: PreviewProvider {
    static var previews: some View {
        FinishGameView(showfinishView: .constant(false), showPrimary: .constant(false), isWin: .constant(0))
    }
}
