//
//  GameFlowCoordinatorModule.swift
//  Alchemist
//
//  Created by Cihan Cinar on 16.05.2024.
//

import Foundation
import Swinject

protocol GameFlowCoordinatorResolver {
    func resolveGameStartWrapper(coordinator: GameFlowCoordinator) -> GameStartViewWrapper
    func resolveGameViewWrapper(coordinator: GameFlowCoordinator, question: Creation) -> GameViewWrapper
}

class GameFlowCoordinatorModule: GameFlowCoordinatorResolver {
    
    private let resolver: Resolver
    private let container: Container
    
    init(parent: Container) {
        self.container = Container(parent: parent)
        self.resolver = container
    }
    
    func resolveGameStartWrapper(coordinator: GameFlowCoordinator) -> GameStartViewWrapper {
        let wrapper = GameStartViewWrapper()
        wrapper.coordinator = coordinator
        return wrapper
    }
    
    func resolveGameViewWrapper(coordinator: GameFlowCoordinator, question: Creation) -> GameViewWrapper {
        let chemistryEngine = resolver.resolve(ChemistryEngineProtocol.self)!
        let wrapper = GameViewWrapper(question: question, chemistryEngine: chemistryEngine)
        wrapper.coordinator = coordinator
        return wrapper
    }
}
