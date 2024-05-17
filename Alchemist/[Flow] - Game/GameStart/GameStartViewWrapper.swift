//
//  GameStartViewWrapper.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import UIKit
import SwiftUI

protocol GameStartViewWrapperCoordinatorDelegate: AnyObject {
   func didTapStartGame(question: Creation)
}

class GameStartViewWrapper: UIViewController, GameStartViewDelegate {
   
    weak var coordinator: GameStartViewWrapperCoordinatorDelegate?
    private var gameStartView: GameStartView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        var gameStartView = GameStartView()
        gameStartView.delegate = self
        self.gameStartView = gameStartView
        
        let hostingController = UIHostingController(rootView: gameStartView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func didCreateRandomQuestion(question: Creation) {
        coordinator?.didTapStartGame(question: question)
    }
}
