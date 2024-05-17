//
//  GameStartViewModel.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import Foundation

class GameStartViewModel: ObservableObject {
    
    var questionContent: Creation?
    
    func createRandomQuestion(difficulty: Difficulty) {
        var creations: [Creation]
        
        switch difficulty {
        case .easy:
            creations = [.steam, .smoke, .lava, .rain, .mud, .dust]
        case .expert:
            creations = [.steam, .smoke, .lava, .rain, .mud, .dust, .acidRain, .ash, .plant]
        }
        
        let randomIndex = Int(arc4random_uniform(UInt32(creations.count)))
        self.questionContent = creations[randomIndex]
    }
}
