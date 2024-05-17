//
//  ChemistryEngineModel.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import Foundation

struct LabElements {
    let fire = "Fire"
    let water = "Water"
    let air = "Air"
    let earth = "Earth"
}

struct LabCreations {
    let steam = "Steam"
    let smoke = "Smoke"
    let lava = "Lava"
    let rain = "Rain"
    let mud = "Mud"
    let dust = "Dust"
    let acidRain = "Acid Rain"
    let plant = "Plant"
    let ash = "Ash"
}

enum Element: Comparable {
    case fire
    case water
    case air
    case earth
    
    func getImageString() -> String {
           switch self {
           case .fire:
               return "🔥"
           case .water:
               return "💧"
           case .air:
               return "💨"
           case .earth:
               return "🌿"
           }
       }
}

enum Creation {
    case steam
    case smoke
    case lava
    case rain
    case mud
    case dust
    case acidRain
    case plant
    case ash
    
    func getImageString() -> String {
           switch self {
           case .steam:
               return "🌫️"
           case .smoke:
               return "💨"
           case .lava:
               return "☄️"
           case .rain:
               return "🌧️"
           case .mud:
               return "🪹"
           case .dust:
               return "🐫"
           case .acidRain:
               return "☢️"
           case .plant:
               return "🪴"
           case .ash:
               return "🌋"
           }
       }
}

