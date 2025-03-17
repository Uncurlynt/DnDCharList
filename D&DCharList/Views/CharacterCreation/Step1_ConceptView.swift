
//
//  Step1_ConceptView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 1: Определение Концепции Персонажа
struct Step1_ConceptView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    @State private var concept: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Концепция персонажа")) {
                TextField("Опишите концепцию вашего персонажа", text: $concept)
            }
            
            Section {
                Button(action: {
                    viewModel.character.concept = concept
                    currentStep += 1
                }) {
                    Text("Далее")
                        .frame(maxWidth: .infinity)
                }
                .disabled(concept.isEmpty)
            }
        }
    }
}
