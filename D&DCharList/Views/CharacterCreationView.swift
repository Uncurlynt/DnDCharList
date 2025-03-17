//
//  CharacterCreationView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Основное представление для создания персонажа
struct CharacterCreationView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentStep: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                ProgressView(value: Double(currentStep), total: 10)
                    .padding()
                
                Spacer()
                
                switch currentStep {
                case 1:
                    Step1_ConceptView(viewModel: viewModel, currentStep: $currentStep)
                case 2:
                    Step2_RaceView(viewModel: viewModel, currentStep: $currentStep)
                case 3:
                    Step3_ClassView(viewModel: viewModel, currentStep: $currentStep)
                case 4:
                    Step4_AbilityScoresView(viewModel: viewModel, currentStep: $currentStep)
                case 5:
                    Step5_BackgroundView(viewModel: viewModel, currentStep: $currentStep)
                case 6:
                    Step6_SkillsView(viewModel: viewModel, currentStep: $currentStep)
                case 7:
                    Step7_EquipmentSelectionView(viewModel: viewModel, currentStep: $currentStep)
                case 8:
                    Step8_HitPointsArmorClassView(viewModel: viewModel, currentStep: $currentStep)
                case 9:
                    Step9_PersonalDetailsView(viewModel: viewModel, currentStep: $currentStep)
                case 10:
                    Step10_FinalizeView(viewModel: viewModel, currentStep: $currentStep)
                default:
                    Text("Неизвестный шаг")
                }
                
                Spacer()
            }
            .navigationBarTitle("Создание Персонажа", displayMode: .inline)
            .navigationBarItems(leading: Button("Отмена") {
                presentationMode.wrappedValue.dismiss()
            })
            .onChange(of: currentStep) { newValue in
                print(">>> currentStep изменился на: \(newValue)")
            }
        }
    }
}

