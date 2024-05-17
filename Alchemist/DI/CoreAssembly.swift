//
//  CoreAssembly.swift
//  Alchemist
//
//  Created by Cihan Cinar on 16.05.2024.
//

import Foundation
import Swinject

class CoreAssembly: Assembly {
    
    func assemble(container: Container) {
            container.register(ChemistryEngineProtocol.self) { _ in
                ChemistryEngine()
            }
        }
}
