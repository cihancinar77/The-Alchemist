//
//  ApplicationFlowCoordinator.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import UIKit
import Swinject

class ApplicationFlowCoordinator: FlowCoordination {
    
    private var window: UIWindow
    private let navigationController = UINavigationController()
    private var gameFlowCoordinator: GameFlowCoordinator?
    private let container: Container
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        window.rootViewController = navigationController
    }
    
    func start() {
        let gameFlowCoordinator = GameFlowCoordinator.build(window: window, coordinator: self, container: container)
        self.gameFlowCoordinator = gameFlowCoordinator
        gameFlowCoordinator.start()
    }
}

extension ApplicationFlowCoordinator: GameFlowCoordinatorDelegate {
    func didGameFlowFinish() {
        //
    }
}
