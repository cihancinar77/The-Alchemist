//
//  GameViewModel.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import Foundation

class GameViewModel: ObservableObject {
    
    let chemistryEngine: ChemistryEngineProtocol
    
    let elements: [Element] = [.air, .earth, .fire, .water]
    @Published var selectedElements: Set<Element> = []
    let question: Creation
    var isAnswerCorrect = false
    
    init(question: Creation, chemistryEngine: ChemistryEngineProtocol) {
        self.question = question
        self.chemistryEngine = chemistryEngine
    }
    
    func checkSelectionResult() {
        let elements: [Element] = Array(selectedElements)
        let result = chemistryEngine.inventLabCreation(elements: elements)
        isAnswerCorrect = result == question
    }
    
    func displayResultModel() -> GameResultAlertViewModel {
        let model = GameResultAlertViewModel(
            title: isAnswerCorrect ? "Congratulations!" : "You should study more",
            message: isAnswerCorrect ? "Correct answer." : "Wrong answer.",
            buttonTitle: isAnswerCorrect ? "Done" : "Retry"
        )
        return model
    }
}
