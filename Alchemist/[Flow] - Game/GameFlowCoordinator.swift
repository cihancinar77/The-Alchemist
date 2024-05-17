//
//  GameFlowCoordinator.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import UIKit
import Swinject

protocol GameFlowCoordinatorDelegate: AnyObject {
    func didGameFlowFinish()
}

class GameFlowCoordinator: FlowCoordination {
    
    private let window: UIWindow
    private var navigationController: UINavigationController
    private let coordinator: GameFlowCoordinatorDelegate
    private let container: Container
    private let resolver: GameFlowCoordinatorResolver
    private var gameStartViewWrapper: GameStartViewWrapper?
    private var gameViewWrapper: GameViewWrapper?
   
    
    init(window: UIWindow, coordinator: GameFlowCoordinatorDelegate, container: Container, resolver: GameFlowCoordinatorResolver) {
        self.container = container
        self.resolver = resolver
        self.coordinator = coordinator
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        window.rootViewController = navigationController
        self.window = window
    }
    
    func start() {
        let gameStartViewWrapper = resolver.resolveGameStartWrapper(coordinator: self)
        self.gameStartViewWrapper = gameStartViewWrapper
        navigationController.viewControllers = [gameStartViewWrapper]
    }
    
    func startGame(question: Creation) {
        let gameViewWrapper = resolver.resolveGameViewWrapper(coordinator: self, question: question)
        gameViewWrapper.coordinator = self
        self.gameViewWrapper = gameViewWrapper
        navigationController.pushViewController(gameViewWrapper, animated: true)
    }
}

extension GameFlowCoordinator: GameStartViewWrapperCoordinatorDelegate {
    func didTapStartGame(question: Creation) {
        startGame(question: question)
    }
}

extension GameFlowCoordinator: GameViewWrapperCoordinatorDelegate {
    func didTapFinish() {
        gameViewWrapper = nil
        start()
    }
}
