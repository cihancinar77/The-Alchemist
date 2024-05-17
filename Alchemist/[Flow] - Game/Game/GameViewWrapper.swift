//
//  GameViewWrapper.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import UIKit
import SwiftUI


protocol GameViewWrapperCoordinatorDelegate: AnyObject {
   func didTapFinish()
}

class GameViewWrapper: UIViewController, GameViewDelegate {
   
    let questionContent: Creation
    let chemistryEngine: ChemistryEngineProtocol
    
    weak var coordinator: GameViewWrapperCoordinatorDelegate?
    private var gameView: GameView?
    
    init(question: Creation, chemistryEngine: ChemistryEngineProtocol) {
        self.questionContent = question
        self.chemistryEngine = chemistryEngine
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        var gameView = GameView(viewModel: GameViewModel(question: questionContent, chemistryEngine: chemistryEngine))
        gameView.delegate = self
        self.gameView = gameView
        let backButton = UIBarButtonItem()

//        navigationController?.isNavigationBarHidden = true
        
        let hostingController = UIHostingController(rootView: gameView)
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
    
    func didTapFinish() {
        coordinator?.didTapFinish()
    }
}
