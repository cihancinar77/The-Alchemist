//
//  ChemistryEngine.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import Foundation

protocol ChemistryEngineProtocol {
    func inventLabCreation(elements: [Element]) -> Creation?
}

class ChemistryEngine: ChemistryEngineProtocol {
    
    func inventLabCreation(elements: [Element]) -> Creation? {
        guard elements.count >= 2 && elements.count <= 3 else {
            return nil
        }
        let sortedElements = elements.sorted()
        switch sortedElements {
        case [.fire, .water]:
            return .steam
        case [.fire, .air]:
            return .smoke
        case [.fire, .earth]:
            return .lava
        case [.water, .air]:
            return .rain
        case [.water, .earth]:
            return .mud
        case [.air, .earth]:
            return .dust
        case [.fire, .water, .air]:
            return .acidRain
        case [.fire, .water, .earth]:
            return .plant
        case [.water, .air, .earth]:
            return .ash

        default:
            return nil
        }
    }
}
