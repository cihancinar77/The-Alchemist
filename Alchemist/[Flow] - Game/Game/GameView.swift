//
//  GameView.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import SwiftUI

protocol GameViewDelegate: AnyObject {
    func didTapFinish()
}

struct GameView: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // 2 columns
    @State private var showResult = false
    weak var delegate: GameViewDelegate?
    @ObservedObject var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        Spacer()
        Text(viewModel.question.getImageString())
            .font(.system(size: 60))
            .padding()
            .background(.green.opacity(0.2))
            .clipShape(Circle())
        Text("Invent \(viewModel.question.self) by combining two or three elements!")
            .font(.title)
            .padding()
            .multilineTextAlignment(.center)
        Spacer(minLength: 30)
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(viewModel.elements, id: \.self) { element in
                Button(action: {
                    if viewModel.selectedElements.contains(element) {
                        viewModel.selectedElements.remove(element)
                    } else {
                        guard viewModel.selectedElements.count < 3 else { return }
                        viewModel.selectedElements.insert(element)
                    }
                }) {
                    Text(element.getImageString())
                        .font(.system(size: 60))
                        .frame(width: 120, height: 120)
                        .background(viewModel.selectedElements.contains(element) ? Color.blue.opacity(0.6) : Color(UIColor.lightGray))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(30)
        Spacer()
        Button("Confirm selection") {
            viewModel.checkSelectionResult()
            showResult = true
        }
        .padding()
        .background(.pink.gradient)
        .foregroundColor(.white)
        .font(.title2)
        .cornerRadius(25)
        .alert(isPresented: $showResult) {
            
            let alertModel = viewModel.displayResultModel()
            return Alert(
                title: Text(alertModel.title),
                message: Text(alertModel.message),
                dismissButton: .default(Text(alertModel.buttonTitle), action: {
                    if viewModel.isAnswerCorrect {
                        delegate?.didTapFinish()
                    }
                })
            )
        }
        
        Spacer(minLength: 60)
    }
}

#Preview {
    GameView(viewModel: GameViewModel(question: .dust, chemistryEngine: ChemistryEngineProtocol.self as! ChemistryEngineProtocol))
}
