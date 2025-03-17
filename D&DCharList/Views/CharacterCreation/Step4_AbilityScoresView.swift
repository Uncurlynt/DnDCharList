//
//  Step4_AbilityScoresView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 4: Распределение Характеристик
struct Step4_AbilityScoresView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    let standardArray: [Int] = [15, 14, 13, 12, 10, 8]
    
    @State private var allocatedScores: [Int] = []
    
    var body: some View {
        Form {
            Section(header: Text("Стандартный массив")) {
                Text("15, 14, 13, 12, 10, 8")
            }
            
            Section(header: Text("Назначьте характеристики")) {
                ForEach($viewModel.character.abilityScores) { $abilityScore in
                    Stepper("\(abilityScore.name.rawValue): \(abilityScore.score)", value: $abilityScore.score, in: 1...20)
                }
            }
            
            Section {
                HStack {
                    Button(action: {
                        currentStep += 1
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(width: 120, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            Section {
                Button(action: {
                    currentStep -= 1
                }) {
                    Text("Назад")
                        .bold()
                        .frame(width: 120, height: 44)
                        .background(Color.gray.opacity(0.3))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
            }
        }
    }
}
