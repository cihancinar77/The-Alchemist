//
//  GameFlowCoordinator+Build.swift
//  Alchemist
//
//  Created by Cihan Cinar on 16.05.2024.
//

import Foundation
import Swinject

extension GameFlowCoordinator {
    static func build(window: UIWindow, coordinator: GameFlowCoordinatorDelegate, container: Container) -> GameFlowCoordinator {
        let resolver = GameFlowCoordinatorModule(parent: container)
        return GameFlowCoordinator(window: window, coordinator: coordinator, container: container, resolver: resolver)
    }
}
