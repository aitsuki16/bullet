//
//  Game.swift
//  bulleye
//
//  Created by Ai on 2022/09/09.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
       100 - abs(target - sliderValue)
    }
}
