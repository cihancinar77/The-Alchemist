//
//  GameStartView.swift
//  Alchemist
//
//  Created by Cihan Cinar on 15.05.2024.
//

import SwiftUI

protocol GameStartViewDelegate: AnyObject {
    func didCreateRandomQuestion(question: Creation)
}

struct GameStartView: View {
    @StateObject var viewModel = GameStartViewModel()
    weak var delegate: GameStartViewDelegate?
    
    var body: some View {
        Text("👩🏼‍🔬")
            .font(.system(size: 150))
        Text("Let's invent some cool stuff together!")
            .font(Font.custom("Marker Felt Thin", size: 24))
            .padding(.horizontal)
            .multilineTextAlignment(.center)
        Button("Ready?") {
            viewModel.createRandomQuestion(difficulty: .expert)
            guard let creation = viewModel.questionContent else { return}
            delegate?.didCreateRandomQuestion(question: creation)
        }
        .padding()
        .background(.pink.gradient)
        .foregroundColor(.white)
        .font(.body)
        .cornerRadius(25)
        Text("You need to combine two or three components to create what Jade, your Laboratory Manager, is asking of you!")
            .multilineTextAlignment(.center)
            .padding()
            .font(.caption)
    }
}

#Preview {
    GameStartView()
}
