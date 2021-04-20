//
//  UnoData.swift
//  ConanGame
//
//  Created by 白謹瑜 on 2021/3/22.
//

import Foundation

struct playercards:Identifiable {
    var id=UUID()
    var playerNumber:Int
    var card:String
    
    var cardColor:Int //blue:1 green:2 red:3 yellow:4 wild:5 wilddrawfour:6
    var cardNumber:Int //0~9 +2:10 return:11 stop:12 wild:13 wild+4:14
    
    var theme:Int
    var cardposition:Int
    var cardpositiony:Int
    
    var isPlayCard:Bool
}

class GameTimer: ObservableObject {
    private var frequency = 1.0
    private var timer: Timer?
    private var startDate: Date?
    @Published var secondsElapsed = 0
    func start() {
        secondsElapsed = 0
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true)
        { timer in
            if let startDate = self.startDate {
                self.secondsElapsed = Int(timer.fireDate.timeIntervalSince1970 -
                                            startDate.timeIntervalSince1970)
            }
        }
    }
    func stop() {
        timer?.invalidate()
        timer = nil
        
    }
}

struct cards {
    var card:String
    var cardColor:Int //blue:1 green:2 red:3 yellow:4 wild:5 wilddrawfour:6
    var cardNumber:Int //0~9 +2:10 return:11 stop:12 wild:13 wild+4:14
    
}
