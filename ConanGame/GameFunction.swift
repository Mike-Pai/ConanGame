//
//  GameFunction.swift
//  ConanGame
//
//  Created by 白謹瑜 on 2021/4/14.
//

import Foundation

func checkFirstcard(card:String,cardColor:Int,cardNumber:Int) -> Bool {
    if cardNumber == 13 || cardNumber == 14 {
        return false
    }
    return true
}

func checkPlayerCard(player:[playercards],card:String,cardColor:Int,cardNumber:Int,playerInputtern:[Bool]) ->[Bool]{
    var playertern = playerInputtern
    for item in player.indices {
        if player[item].cardColor == cardColor {
            playertern[item] = false
        }else if player[item].cardNumber == cardNumber {
            playertern[item] = false
        }else if player[item].cardNumber == 13 {
            playertern[item] = false
        }else if player[item].cardNumber == 14{
            playertern[item] = false
        }else{
            playertern[item] = true
        }
    }
    return playertern
}

func unoComputerPlayerplayer(player:[playercards],card:String,cardColor:Int,cardNumber:Int) ->(card:String,cardColor:Int,cardNumber:Int,computerCardIndex:Int)?{

    var playerComputerCanUse = [(String,Int,Int,Int)]()
    var color = ""
    
    for item in player.indices {
        if player[item].cardColor == cardColor {
            playerComputerCanUse.append((player[item].card,player[item].cardColor,player[item].cardNumber,item))
        }else if player[item].cardNumber == cardNumber {
            playerComputerCanUse.append((player[item].card,player[item].cardColor,player[item].cardNumber,item))
        }else if player[item].cardNumber == 13 {
            let randomColorNumber = Int.random(in: 1...4)
            
            if randomColorNumber == 1 {
                color = "Color.blue"
            }else if randomColorNumber == 2 {
                color = "Color.green"
            }else if randomColorNumber == 4 {
                color = "Color.yellow"
            }else if randomColorNumber == 3 {
                color = "Color.red"
            }

            playerComputerCanUse.append((color,randomColorNumber,player[item].cardNumber,item))
        }else if player[item].cardNumber == 14{
            let randomColorNumber = Int.random(in: 1...4)
            
            if randomColorNumber == 1 {
                color = "Color.blue"
            }else if randomColorNumber == 2 {
                color = "Color.green"
            }else if randomColorNumber == 4 {
                color = "Color.yellow"
            }else if randomColorNumber == 3 {
                color = "Color.red"
            }
            playerComputerCanUse.append((color,randomColorNumber,player[item].cardNumber,item))
        }
    }
    playerComputerCanUse.shuffle()
    if playerComputerCanUse.isEmpty{
        return nil
    }else{
        return (playerComputerCanUse[0])
    }
}


