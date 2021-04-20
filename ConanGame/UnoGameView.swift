//
//  UnoGameView.swift
//  ConanGame
//
//  Created by 白謹瑜 on 2021/3/22.
//

import SwiftUI





struct UnoGameView: View {
    
    @Binding var showPrimary:Bool
    @State private var showFinishView = false
    @State private var isWin = 2
    
    var playerNumber:Int
    @State private var cardsoffset:CGFloat = -40
    @State private var cardsOpacity:Double = 0
    @State private var cardsFaceDeragee:Double = 0
    @State private var cardsDeragee:Double = -90
    @State private var showBeginbutton = true
    
    @State private var playerChoseCard = "" //玩家目前選的牌
    @State private var playChoseCardNumber = -1
    @State private var playChoseCardColor = -1
    @State private var playChoseCardIndex = -1
    @State private var playhasChoseCard = false
    @State private var startGame = true
    @State private var player1tern = [ //控制玩家可選哪些牌
        true,
        true,
        true,
        true,
        true,
        true,
        true,
    ]
    @State private var firstCardindex = 107 //第一張牌
    
    @State private var deskCardNumber =  unoCards[107].cardNumber //桌面上的牌
    @State private var deskCard = unoCards[107].card
    @State private var deskCardColor = unoCards[107].cardColor
    
    
    @State private var player1 = [
        playercards(playerNumber: 0, card: unoCards[0].card, cardColor: unoCards[0].cardColor, cardNumber: unoCards[0].cardNumber, theme: 1, cardposition: -3, cardpositiony: 0, isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[1].card, cardColor: unoCards[1].cardColor, cardNumber: unoCards[1].cardNumber, theme: 1, cardposition: -2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[2].card, cardColor: unoCards[2].cardColor, cardNumber: unoCards[2].cardNumber, theme: 1, cardposition: -1, cardpositiony: 0, isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[3].card, cardColor: unoCards[3].cardColor, cardNumber: unoCards[3].cardNumber, theme: 1, cardposition: 0, cardpositiony: 0, isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[4].card, cardColor: unoCards[4].cardColor, cardNumber: unoCards[4].cardNumber, theme: 1, cardposition: 1, cardpositiony: 0, isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[5].card, cardColor: unoCards[5].cardColor, cardNumber: unoCards[5].cardNumber, theme: 1, cardposition: 2, cardpositiony: 0, isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[6].card, cardColor: unoCards[6].cardColor, cardNumber: unoCards[6].cardNumber, theme: 1, cardposition: 3, cardpositiony: 0, isPlayCard: true),
    ]
    @State private var player2 = [
        playercards(playerNumber: 0, card: unoCards[7].card, cardColor: unoCards[7].cardColor, cardNumber: unoCards[7].cardNumber, theme: 1, cardposition: -3, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[8].card, cardColor: unoCards[8].cardColor, cardNumber: unoCards[8].cardNumber, theme: 1, cardposition: -2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[9].card, cardColor: unoCards[9].cardColor, cardNumber: unoCards[9].cardNumber, theme: 1, cardposition: -1, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[10].card, cardColor: unoCards[10].cardColor, cardNumber: unoCards[10].cardNumber, theme: 1, cardposition: 0, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[11].card, cardColor: unoCards[11].cardColor, cardNumber: unoCards[11].cardNumber, theme: 1, cardposition: 1, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[12].card, cardColor: unoCards[12].cardColor, cardNumber: unoCards[12].cardNumber, theme: 1, cardposition: 2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[13].card, cardColor: unoCards[13].cardColor, cardNumber: unoCards[13].cardNumber, theme: 1, cardposition: 3, cardpositiony: 0,isPlayCard: true),
    ]
    @State private var player3 = [
        playercards(playerNumber: 0, card: unoCards[14].card, cardColor: unoCards[14].cardColor, cardNumber: unoCards[14].cardNumber, theme: 1, cardposition: -3, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[15].card, cardColor: unoCards[15].cardColor, cardNumber: unoCards[15].cardNumber, theme: 1, cardposition: -2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[16].card, cardColor: unoCards[16].cardColor, cardNumber: unoCards[16].cardNumber, theme: 1, cardposition: -1, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[17].card, cardColor: unoCards[17].cardColor, cardNumber: unoCards[17].cardNumber, theme: 1, cardposition: 0, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[18].card, cardColor: unoCards[18].cardColor, cardNumber: unoCards[18].cardNumber, theme: 1, cardposition: 1, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[19].card, cardColor: unoCards[19].cardColor, cardNumber: unoCards[19].cardNumber, theme: 1, cardposition: 2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[20].card, cardColor: unoCards[20].cardColor, cardNumber: unoCards[20].cardNumber, theme: 1, cardposition: 3, cardpositiony: 0,isPlayCard: true),
    ]
    @State private var player4 = [
        playercards(playerNumber: 0, card: unoCards[21].card, cardColor: unoCards[21].cardColor, cardNumber: unoCards[21].cardNumber, theme: 1, cardposition: -3, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[22].card, cardColor: unoCards[22].cardColor, cardNumber: unoCards[22].cardNumber, theme: 1, cardposition: -2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[23].card, cardColor: unoCards[23].cardColor, cardNumber: unoCards[23].cardNumber, theme: 1, cardposition: -1, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[24].card, cardColor: unoCards[24].cardColor, cardNumber: unoCards[24].cardNumber, theme: 1, cardposition: 0, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[25].card, cardColor: unoCards[25].cardColor, cardNumber: unoCards[25].cardNumber, theme: 1, cardposition: 1, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[26].card, cardColor: unoCards[26].cardColor, cardNumber: unoCards[26].cardNumber, theme: 1, cardposition: 2, cardpositiony: 0,isPlayCard: true),
        playercards(playerNumber: 0, card: unoCards[27].card, cardColor: unoCards[27].cardColor, cardNumber: unoCards[27].cardNumber, theme: 1, cardposition: 3, cardpositiony: 0,isPlayCard: true),
    ]
    @State private var restCards = [ //剩餘的牌庫
        unoCards[28],
        unoCards[29],
        unoCards[30],
        unoCards[31],
        unoCards[32],
        unoCards[33],
        unoCards[34],
        unoCards[35],
        unoCards[36],
        unoCards[37],
        unoCards[38],
        unoCards[39],
        unoCards[40],
        unoCards[41],
        unoCards[42],
        unoCards[43],
        unoCards[44],
        unoCards[45],
        unoCards[46],
        unoCards[47],
        unoCards[48],
        unoCards[49],
        unoCards[50],
        unoCards[51],
        unoCards[52],
        unoCards[53],
        unoCards[54],
        unoCards[55],
        unoCards[56],
        unoCards[57],
        unoCards[58],
        unoCards[59],
        unoCards[60],
        unoCards[61],
        unoCards[62],
        unoCards[63],
        unoCards[64],
        unoCards[65],
        unoCards[66],
        unoCards[67],
        unoCards[68],
        unoCards[69],
        unoCards[70],
        unoCards[71],
        unoCards[72],
        unoCards[73],
        unoCards[74],
        unoCards[75],
        unoCards[76],
        unoCards[77],
        unoCards[78],
        unoCards[79],
        unoCards[80],
        unoCards[81],
        unoCards[82],
        unoCards[83],
        unoCards[84],
        unoCards[85],
        unoCards[86],
        unoCards[87],
        unoCards[88],
        unoCards[89],
        unoCards[90],
        unoCards[91],
        unoCards[92],
        unoCards[93],
        unoCards[94],
        unoCards[95],
        unoCards[96],
        unoCards[97],
        unoCards[98],
        unoCards[99],
        unoCards[100],
        unoCards[101],
        unoCards[102],
        unoCards[103],
        unoCards[104],
        unoCards[105],
        unoCards[106],
        unoCards[107],        
    ]
    @State private var restCardNumber = 28
    
    @State private var playerTern = true //控制出牌及Pass按鈕
    @State private var playerPass = true
    
    @State private var showChoseCardColor = false //控制+4及王牌的顏色
    @State private var isChose = false //控制選擇哪張牌，讓排往上跑一點
    @State private var wildColorOpacitySet = 0.0
    @State private var color = Color.white
    @State private var voiceClose = false
    @State private var rotateUnoAngle = 0
    var body: some View {
        VStack {
            VStack {
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        if voiceClose == true{
                            
                        }else{
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .background(Color.white.opacity(0.3))
                        }
                    }
                    .padding(.leading)
                    .foregroundColor(.gray)

                    Spacer()
                    Button(action: {
                        isWin = 0
                        showFinishView = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .background(Color.white.opacity(0.3))
                    }
                    .padding(.trailing)
                    .foregroundColor(.gray)
                    
                }
                
                VStack {
                    ZStack{
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(player2){ player in
                                    Image("UnoCardback")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .opacity(cardsOpacity)
                                        //                                    .offset(x:cardsoffset*CGFloat(player1[index].cardposition))
                                        .animation(.linear(duration:0.3))
                                    
                                }
                                
                            }
                        }
                        if player2.count == 1 {
                            Text("UNO!")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.red)
                                .background(Color.black)
                                .rotation3DEffect(
                                    Angle(degrees: Double(rotateUnoAngle)),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                    
                                    )
                                .animation(
                                    Animation
                                        .linear(duration: 0.5)
                                        .repeatForever(autoreverses: true)
                                )
                                .onAppear(){
                                    rotateUnoAngle = 30
                                }
                                
                        }
                    }
                    Spacer()
                    HStack{
                        if playerNumber >= 3{
                            ZStack{
                                ScrollView(){
                                    VStack {
                                        ForEach(player3){ index in
                                            Image("UnoCardback")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80, alignment: .center)
                                                .opacity(cardsOpacity)
                                                .rotationEffect(.degrees(90))
                                                .animation(.linear(duration:0.3))
                                        }
                                        
                                    }
                                }
                                if player3.count == 1 {
                                    Text("UNO!")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.red)
                                        .background(Color.black)
                                        .rotation3DEffect(
                                            Angle(degrees: Double(rotateUnoAngle)),
                                            axis: (x: 0.0, y: 1.0, z: 0.0)
                                            
                                            )
                                        .animation(
                                            Animation
                                                .linear(duration: 0.5)
                                                .repeatForever(autoreverses: true)
                                        )
                                        .onAppear(){
                                            rotateUnoAngle = 30
                                        }
                                        
                                }
                            }
                        }
                        
                        Spacer()
                        VStack{
                            if showBeginbutton == true{
                                Image("UnoCardback")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .opacity(cardsOpacity)
                                    .animation(.linear(duration:0.3))
                                
                            }else{
                                Image("\(deskCard)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .opacity(cardsOpacity)
                                    .animation(.linear(duration:0.3))
                                    .background(color.opacity(wildColorOpacitySet))
                                
                            }
                            
                            
                            
                            Button(action: {
                                showBeginbutton = false
                                cardsFaceDeragee = 90
                                cardsDeragee = 0
                                
                                while(!checkFirstcard(card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber)){
                                    
                                    firstCardindex = firstCardindex - 1
                                    deskCard = unoCards[firstCardindex].card
                                    deskCardColor = unoCards[firstCardindex].cardColor
                                    deskCardNumber = unoCards[firstCardindex].cardNumber
                                }
                                
                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                
                                playerPass = false
                                
                                
                                
                                
                            }) {
                                if showBeginbutton == true {
                                    Text("開始")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .padding(8.0)
                                        .font(.caption)
                                        .background(
                                            Capsule()
                                                .foregroundColor(.blue)
                                        )
                                }
                            }
                        }
                        Spacer()
                        if playerNumber >= 4 {
                            ZStack{
                                ScrollView(){
                                    VStack {
                                        ForEach(player4){ index in
                                            Image("UnoCardback")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80, alignment: .center)
                                                .opacity(cardsOpacity)
                                                .rotationEffect(.degrees(-90))
                                                .animation(.linear(duration:0.3))
                                            
                                        }
                                        
                                    }
                                }
                                if player4.count == 1 {
                                    Text("UNO!")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .background(Color.black)
                                        .foregroundColor(Color.red)
                                        .rotation3DEffect(
                                            Angle(degrees: Double(rotateUnoAngle)),
                                            axis: (x: 0.0, y: 1.0, z: 0.0)
                                            
                                            )
                                        .animation(
                                            Animation
                                                .linear(duration: 0.5)
                                                .repeatForever(autoreverses: true)
                                        )
                                        .onAppear(){
                                            rotateUnoAngle = 30
                                        }
                                        
                                }
                            }
                        }
                    }
                    Spacer()
                    VStack {
                        if showChoseCardColor == true {
                            HStack {
                                Button(action: { //wild按下綠色
                                    deskCard = "Color.green"
                                    deskCardColor = 2
                                    deskCardNumber = -1
                                    color = Color.green
                                    wildColorOpacitySet = 1
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if playerNumber == 3{
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                            }else if playerNumber == 4 {
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                    if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer3.card
                                                        deskCardColor = computer3.cardColor
                                                        deskCardNumber = computer3.cardNumber
                                                        player4.remove(at: computer3.computerCardIndex)
                                                        if player4.isEmpty{
                                                            showFinishView = true
                                                        }
                                                        
                                                    }else{
                                                        player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                    playerPass = false
                                                }
                                                
                                            }else{
                                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                    if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer1.card
                                                        deskCardColor = computer1.cardColor
                                                        deskCardNumber = computer1.cardNumber
                                                        player2.remove(at: computer1.computerCardIndex)
                                                        if player2.isEmpty{
                                                            showFinishView = true
                                                        }
                                                    }else{
                                                        player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                    playerPass = false
                                                }
                                            }
                                        
                                        
                                    }
                                    showChoseCardColor = false
                                    wildColorOpacitySet = 0
                                    
                                }) {
                                    Color.green.frame(width: 80, height: 50, alignment: .center)
                                }
                                Button(action: { //wild 按下黃色
                                    deskCard = "Color.yellow"
                                    deskCardColor = 4
                                    deskCardNumber = -1
                                    color = Color.yellow
                                    wildColorOpacitySet = 1
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if playerNumber == 3{
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                            }else if playerNumber == 4 {
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                    if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer3.card
                                                        deskCardColor = computer3.cardColor
                                                        deskCardNumber = computer3.cardNumber
                                                        player4.remove(at: computer3.computerCardIndex)
                                                        if player4.isEmpty{
                                                            showFinishView = true
                                                        }
                                                    }else{
                                                        player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                    playerPass = false
                                                }
                                                
                                            }else{
                                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                    if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer1.card
                                                        deskCardColor = computer1.cardColor
                                                        deskCardNumber = computer1.cardNumber
                                                        player2.remove(at: computer1.computerCardIndex)
                                                        if player2.isEmpty{
                                                            showFinishView = true
                                                        }
                                                    }else{
                                                        player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                    playerPass = false
                                                }
                                            }
                                    }
                                    showChoseCardColor = false
                                    wildColorOpacitySet = 0
                                    
                                }) {
                                    Color.yellow.frame(width: 80, height: 50, alignment: .center)
                                }
                                Button(action: { //wild 按下紅色
                                    deskCard = "Color.red"
                                    deskCardColor = 3
                                    deskCardNumber = -1
                                    color = Color.red
                                    wildColorOpacitySet = 1
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if playerNumber == 3{
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                            }else if playerNumber == 4 {
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                    if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer3.card
                                                        deskCardColor = computer3.cardColor
                                                        deskCardNumber = computer3.cardNumber
                                                        player4.remove(at: computer3.computerCardIndex)
                                                        if player4.isEmpty{
                                                            showFinishView = true
                                                        }
                                                        
                                                    }else{
                                                        player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                    playerPass = false
                                                }
                                                
                                            }else{
                                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                    if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer1.card
                                                        deskCardColor = computer1.cardColor
                                                        deskCardNumber = computer1.cardNumber
                                                        player2.remove(at: computer1.computerCardIndex)
                                                        if player2.isEmpty{
                                                            showFinishView = true
                                                        }
                                                    }else{
                                                        player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                    playerPass = false
                                                }
                                            }
                                        }
                                    
                                    showChoseCardColor = false
                                    wildColorOpacitySet = 0
                                    
                                }) {
                                    Color.red.frame(width: 80, height: 50, alignment: .center)
                                }
                                Button(action: { //wild 按下藍色
                                    deskCard = "Color.blue"
                                    deskCardColor = 1
                                    deskCardNumber = -1
                                    color = Color.blue
                                    wildColorOpacitySet = 1
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if playerNumber == 3{
                                                if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer2.card
                                                    deskCardColor = computer2.cardColor
                                                    deskCardNumber = computer2.cardNumber
                                                    player3.remove(at: computer2.computerCardIndex)
                                                    if player3.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                            }else if playerNumber == 4 {
                                                    if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                        deskCard = computer2.card
                                                        deskCardColor = computer2.cardColor
                                                        deskCardNumber = computer2.cardNumber
                                                        player3.remove(at: computer2.computerCardIndex)
                                                        if player3.isEmpty{
                                                            showFinishView = true
                                                        }
                                                    }else{
                                                        player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                        restCardNumber = restCardNumber + 1
                                                    }
                                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                        if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                            deskCard = computer3.card
                                                            deskCardColor = computer3.cardColor
                                                            deskCardNumber = computer3.cardNumber
                                                            player4.remove(at: computer3.computerCardIndex)
                                                            if player4.isEmpty{
                                                                showFinishView = true
                                                            }
                                                        }else{
                                                            player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                            restCardNumber = restCardNumber + 1
                                                        }
                                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                        playerPass = false
                                                    }
                                        }else{
                                            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer1.card
                                                    deskCardColor = computer1.cardColor
                                                    deskCardNumber = computer1.cardNumber
                                                    player2.remove(at: computer1.computerCardIndex)
                                                    if player2.isEmpty{
                                                        showFinishView = true
                                                    }
                                                }else{
                                                    player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                            }
                                        }
                                    }
                                    showChoseCardColor = false
                                    wildColorOpacitySet = 0
                                }) {
                                    Color.blue.frame(width: 80, height: 50, alignment: .center)
                                }
                            }
                        }
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(Array(player1.enumerated()),id:\.element.id){index, player in //特殊的ForEach寫法
                                    ZStack{
                                        Image("UnoCardback")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 55, height: 80, alignment: .center)
                                            .opacity(cardsOpacity)
                                            .rotation3DEffect(   
                                                .degrees(cardsFaceDeragee),
                                                axis: (x: 0.0, y: 1.0, z: 0.0)
                                            )
                                            .animation(.linear(duration:0.2))
                                        //                                            .offset(x:cardsoffset*CGFloat(player1[index].cardposition))
                                        Button(action: {
                                            playhasChoseCard = true
                                            playerTern = false
                                            if isChose == false{
                                                player1[index].cardpositiony = -10
                                                isChose.toggle()
                                            } else {
                                                for item in player1.indices{
                                                    player1[item].cardpositiony = 0
                                                }
                                                player1[index].cardpositiony = -10
                                            }
                                            
                                            playerChoseCard = player1[index].card
                                            playChoseCardColor = player1[index].cardColor
                                            playChoseCardNumber = player1[index].cardNumber
                                            playChoseCardIndex = index
                                        }, label: {
                                            Image(player.card)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80, alignment: .center)
                                                .opacity(cardsOpacity)
                                                .rotation3DEffect(
                                                    .degrees(cardsDeragee),
                                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                                )
                                                .animation(Animation.linear.delay(0.2))
                                            
                                        })
                                        .disabled(player1tern[index])
                                        .offset(y:CGFloat(player.cardpositiony))
                                        
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                    }
                }
                .onAppear{
                    cardsOpacity=1
                }
            }
            HStack {
                if player1.count == 1 {
                    Text("UNO!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.red)
                        .background(Color.black)
                        .padding(.leading)
                        .rotation3DEffect(
                            Angle(degrees: Double(rotateUnoAngle)),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                            
                            )
                        .animation(
                            Animation
                                .linear(duration: 0.5)
                                .repeatForever(autoreverses: true)
                        )
                        .onAppear(){
                            rotateUnoAngle = 30
                        }
                        
                }else{
                    Spacer()

                }
                Text("玩家1")
                    .padding()
                HStack {
                    Button(action: {
                        isWin = 2
                        if restCardNumber >= 70{
                            restCardNumber = 0
                        }
                        for item in player1tern.indices {
                            player1tern[item] = true
                        }
                        
                        playerTern = true
                        playerPass = true
                        deskCard = playerChoseCard
                        deskCardColor = playChoseCardColor
                        deskCardNumber = playChoseCardNumber
                        player1.remove(at: playChoseCardIndex)
                        player1tern.remove(at: playChoseCardIndex)
                        
                        if player1.isEmpty{
                            showFinishView = true
                            isWin = 1
                        }else{
                            if playChoseCardNumber == 10{
                                for _ in 1...2 {
                                    player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                    restCardNumber = restCardNumber + 1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                    if playerNumber == 3{
                                        if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer2.card
                                            deskCardColor = computer2.cardColor
                                            deskCardNumber = computer2.cardNumber
                                            player3.remove(at: computer2.computerCardIndex)
                                            if player3.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                        playerPass = false
                                    }else if playerNumber == 4 {
                                        if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer2.card
                                            deskCardColor = computer2.cardColor
                                            deskCardNumber = computer2.cardNumber
                                            player3.remove(at: computer2.computerCardIndex)
                                            if player3.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                deskCard = computer3.card
                                                deskCardColor = computer3.cardColor
                                                deskCardNumber = computer3.cardNumber
                                                player4.remove(at: computer3.computerCardIndex)
                                                if player4.isEmpty{
                                                    showFinishView = true
                                                }
                                            }else{
                                                player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                restCardNumber = restCardNumber + 1
                                            }
                                            player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                            playerPass = false
                                        }
                                        
                                    }
                                    else{
                                        if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer1.card
                                            deskCardColor = computer1.cardColor
                                            deskCardNumber = computer1.cardNumber
                                            player2.remove(at: computer1.computerCardIndex)
                                            if player2.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                        playerPass = false

                                    }
                                }
                            }
                            else if playChoseCardNumber == 11{
                                if playerNumber == 3{
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                        if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer2.card
                                            deskCardColor = computer2.cardColor
                                            deskCardNumber = computer2.cardNumber
                                            player3.remove(at: computer2.computerCardIndex)
                                            if player3.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                deskCard = computer1.card
                                                deskCardColor = computer1.cardColor
                                                deskCardNumber = computer1.cardNumber
                                                player2.remove(at: computer1.computerCardIndex)
                                                if player2.isEmpty{
                                                    showFinishView = true
                                                }
                                            }else{
                                                player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                restCardNumber = restCardNumber + 1
                                            }
                                            player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                            playerPass = false
                                        }
                                    }
                                }else if playerNumber == 4 {
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                        if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer3.card
                                            deskCardColor = computer3.cardColor
                                            deskCardNumber = computer3.cardNumber
                                            player4.remove(at: computer3.computerCardIndex)
                                            if player4.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            
                                            if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                deskCard = computer2.card
                                                deskCardColor = computer2.cardColor
                                                deskCardNumber = computer2.cardNumber
                                                player3.remove(at: computer2.computerCardIndex)
                                                if player3.isEmpty{
                                                    showFinishView = true
                                                }
                                            }else{
                                                player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                restCardNumber = restCardNumber + 1
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                
                                                if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer1.card
                                                    deskCardColor = computer1.cardColor
                                                    deskCardNumber = computer1.cardNumber
                                                    player2.remove(at: computer1.computerCardIndex)
                                                    if player2.isEmpty{
                                                        showFinishView = true
                                                    }

                                                }else{
                                                    player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                                
                                            }
                                        }
                                    }
                                    
                                    
                                }else{
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                        if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer1.card
                                            deskCardColor = computer1.cardColor
                                            deskCardNumber = computer1.cardNumber
                                            player2.remove(at: computer1.computerCardIndex)
                                            if player2.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                        playerPass = false
                                    }
                                }
                                
                                
                            }else if playChoseCardNumber == 12{
                                if playerNumber == 2{
                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                    playerPass = false
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                    if playerNumber == 3{
                                        if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer2.card
                                            deskCardColor = computer2.cardColor
                                            deskCardNumber = computer2.cardNumber
                                            player3.remove(at: computer2.computerCardIndex)
                                            if player3.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                        playerPass = false
                                    }else if playerNumber == 4 {
                                        if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer2.card
                                            deskCardColor = computer2.cardColor
                                            deskCardNumber = computer2.cardNumber
                                            player3.remove(at: computer2.computerCardIndex)
                                            if player3.isEmpty{
                                                showFinishView = true
                                            }
                                        }else{
                                            player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                            if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                deskCard = computer3.card
                                                deskCardColor = computer3.cardColor
                                                deskCardNumber = computer3.cardNumber
                                                player4.remove(at: computer3.computerCardIndex)
                                                if player4.isEmpty{
                                                    showFinishView = true
                                                }

                                            }else{
                                                player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                restCardNumber = restCardNumber + 1
                                            }
                                            player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                            playerPass = false
                                        }
                                        
                                    }
                                }
                            }else if playChoseCardNumber == 13{
                                showChoseCardColor = true
                            }else if playChoseCardNumber == 14{
                                showChoseCardColor = true
                                for _ in 1...4{
                                    player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                    restCardNumber = restCardNumber + 1
                                }
                            }else{
                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                    if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                        deskCard = computer1.card
                                        deskCardColor = computer1.cardColor
                                        deskCardNumber = computer1.cardNumber
                                        player2.remove(at: computer1.computerCardIndex)
                                        if player2.isEmpty{
                                            showFinishView = true
                                        }

                                    }else{
                                        player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                        restCardNumber = restCardNumber + 1
                                    }
                                    if playerNumber == 2{
                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                        playerPass = false
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                        if playerNumber == 3{
                                            if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                deskCard = computer2.card
                                                deskCardColor = computer2.cardColor
                                                deskCardNumber = computer2.cardNumber
                                                player3.remove(at: computer2.computerCardIndex)
                                                if player3.isEmpty{
                                                    showFinishView = true
                                                }

                                            }else{
                                                player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                restCardNumber = restCardNumber + 1
                                            }
                                            player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                            playerPass = false
                                        }else if playerNumber == 4 {
                                            if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                deskCard = computer2.card
                                                deskCardColor = computer2.cardColor
                                                deskCardNumber = computer2.cardNumber
                                                player3.remove(at: computer2.computerCardIndex)
                                                if player3.isEmpty{
                                                    showFinishView = true
                                                }
                                            }else{
                                                player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                restCardNumber = restCardNumber + 1
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                                if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                                    deskCard = computer3.card
                                                    deskCardColor = computer3.cardColor
                                                    deskCardNumber = computer3.cardNumber
                                                    player4.remove(at: computer3.computerCardIndex)
                                                    if player4.isEmpty{
                                                        showFinishView = true
                                                    }

                                                }else{
                                                    player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                                    restCardNumber = restCardNumber + 1
                                                }
                                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                                playerPass = false
                                            }
                                            
                                        }
                                    }
                                }
                            }
                        }
                        
                       
                            
                        
                    }) {
                        Text("出牌")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(8.0)
                            .font(.caption)
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )
                    }
                    .disabled(playerTern)
                    Button(action: {
                        isWin = 2
                        if restCardNumber >= 70{
                            restCardNumber = 0
                        }
                        for item in player1tern.indices {
                            player1tern[item] = true
                        }
                        
                        
                        playerTern = true
                        playerPass = true
                        player1.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true),at: 0)
                        player1tern.insert(true, at: 0)
                        restCardNumber = restCardNumber + 1
                        
                        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                            if let computer1 = unoComputerPlayerplayer(player: player2, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                deskCard = computer1.card
                                deskCardColor = computer1.cardColor
                                deskCardNumber = computer1.cardNumber
                                player2.remove(at: computer1.computerCardIndex)
                                if player2.isEmpty{
                                    showFinishView = true
                                }
                            }else{
                                player2.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                restCardNumber = restCardNumber + 1
                            }
                            if playerNumber == 2{
                                player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                playerPass = false
                            }
                            if playerNumber == 3{
                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                    if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                        deskCard = computer2.card
                                        deskCardColor = computer2.cardColor
                                        deskCardNumber = computer2.cardNumber
                                        player3.remove(at: computer2.computerCardIndex)
                                        if player3.isEmpty{
                                            showFinishView = true
                                        }
                                    }else{
                                        player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                        restCardNumber = restCardNumber + 1
                                    }
                                    player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                    playerPass = false
                                }
                            }else if playerNumber == 4 {
                                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                    if let computer2 = unoComputerPlayerplayer(player: player3, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                        deskCard = computer2.card
                                        deskCardColor = computer2.cardColor
                                        deskCardNumber = computer2.cardNumber
                                        player3.remove(at: computer2.computerCardIndex)
                                        if player3.isEmpty{
                                            showFinishView = true
                                        }
                                    }else{
                                        player3.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                        restCardNumber = restCardNumber + 1
                                    }
                                    
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                        if let computer3 = unoComputerPlayerplayer(player: player4, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber){
                                            deskCard = computer3.card
                                            deskCardColor = computer3.cardColor
                                            deskCardNumber = computer3.cardNumber
                                            player4.remove(at: computer3.computerCardIndex)
                                            if player4.isEmpty{
                                                showFinishView = true
                                            }
                                            
                                        }else{
                                            player4.insert(playercards(playerNumber: 3, card: restCards[restCardNumber].card, cardColor: restCards[restCardNumber].cardColor, cardNumber: restCards[restCardNumber].cardNumber, theme: 0, cardposition: 0, cardpositiony: 0, isPlayCard: true), at: 0)
                                            restCardNumber = restCardNumber + 1
                                        }
                                        player1tern = checkPlayerCard(player: player1, card: deskCard, cardColor: deskCardColor, cardNumber: deskCardNumber, playerInputtern: player1tern)
                                        playerPass = false
                                    }
                                }
                            }
                        }
                        
                        
                        
                        
                    }) {
                        Text("Pass")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(8.0)
                            .font(.caption)
                            .background(
                                Capsule()
                                    .foregroundColor(.red)
                            )
                    }
                    .disabled(playerPass)
                    
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showFinishView, content: {
            FinishGameView(showfinishView: $showFinishView, showPrimary: $showPrimary, isWin: $isWin)
        })
        
    }
}

struct UnoGameView_Previews: PreviewProvider {
    static var previews: some View {
        UnoGameView(showPrimary: .constant(false), playerNumber: 2)
    }
}
