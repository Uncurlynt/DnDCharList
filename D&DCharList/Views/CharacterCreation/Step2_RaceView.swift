//
//  Step2_RaceView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 2: Выбор Расы
struct Step2_RaceView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    let races: [Race] = [
        Race(name: "Человек",
             abilityScoreIncreases: [
                .strength: 1, .dexterity: 1, .constitution: 1,
                .intelligence: 1, .wisdom: 1, .charisma: 1
             ],
             traits: ["Дополнительный язык"]),
        Race(name: "Эльф",
             abilityScoreIncreases: [.dexterity: 2],
             traits: ["Ночное зрение", "Владение луком", "Долголетие"]),
        Race(name: "Дварф",
             abilityScoreIncreases: [.constitution: 2],
             traits: ["Темновидение", "Устойчивость к ядам", "Навыки кузнечного дела"]),
    ]
    
    var body: some View {
        Form {
            Section(header: Text("Выберите расу")) {
                Picker("Раса", selection: $viewModel.character.race) {
                    ForEach(races) { race in
                        Text(race.name).tag(Optional(race))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: viewModel.character.race) { newRace in
                    print(">>> Выбрана раса: \(newRace?.name ?? "nil")")
                }
            }
            
            if let race = viewModel.character.race {
                Section(header: Text("Особенности расы")) {
                    ForEach(race.traits, id: \.self) { trait in
                        Text(trait)
                    }
                }
                
                Section(header: Text("Бонусы характеристик")) {
                    ForEach(race.abilityScoreIncreases.keys.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { ability in
                        Text("\(ability.rawValue): +\(race.abilityScoreIncreases[ability] ?? 0)")
                    }
                }
            }
            
            Section {
                HStack {
                    Button(action: {
                        if let actualRace = viewModel.character.race {
                            print(">>> Нажата кнопка 'Далее', выбранная раса: \(actualRace.name)")
                            viewModel.updateAbilityScores(with: actualRace)
                            currentStep += 1
                            print(">>> currentStep теперь: \(currentStep)")
                        } else {
                            print(">>> Кнопка 'Далее' нажата, но race is nil")
                        }
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(width: 100, height: 44)
                            .background(viewModel.character.race == nil ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(viewModel.character.race == nil)
                }
            }
            
            Section {
    
                Button(action: {
                    print(">>> Нажата кнопка 'Назад'")
                    currentStep -= 1
                }) {
                    Text("Назад")
                        .bold()
                        .frame(width: 100, height: 44)
                        .background(Color.gray.opacity(0.3))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
            }
        }
        .onAppear {
            print(">>> Step2_RaceView появился. currentStep: \(currentStep), race: \(viewModel.character.race?.name ?? "nil")")
        }
    }
}
