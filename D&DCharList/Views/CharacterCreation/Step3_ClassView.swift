//
//  Step3_ClassView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 3: Выбор Класса
struct Step3_ClassView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    let classes: [CharacterClass] = [
        CharacterClass(name: "Воин",
                       primaryAbility: .strength,
                       hitDice: "d10",
                       proficiencies: ["Все доспехи", "Оружие ближнего и дальнего боя"],
                       features: ["Боевой стиль"]),
        CharacterClass(name: "Маг",
                       primaryAbility: .intelligence,
                       hitDice: "d6",
                       proficiencies: ["Оружие посоха"],
                       features: ["Заклинания"]),
        CharacterClass(name: "Разбойник",
                       primaryAbility: .dexterity,
                       hitDice: "d8",
                       proficiencies: ["Легкое оружие", "Инструменты взломщика"],
                       features: ["Скрытность"]),
    ]
    
    var body: some View {
        Form {
            Section(header: Text("Выберите класс")) {
                Picker("Класс", selection: $viewModel.character.characterClass) {
                    ForEach(classes) { charClass in
                        Text(charClass.name).tag(Optional(charClass))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: viewModel.character.characterClass) { newClass in
                    print(">>> Выбран класс: \(newClass?.name ?? "nil")")
                }
            }
            
            if let charClass = viewModel.character.characterClass {
                Section(header: Text("Особенности класса")) {
                    ForEach(charClass.features, id: \.self) { feature in
                        Text(feature)
                    }
                }
            }
            
            Section {
                HStack {
                    Button(action: {
                        if let actualClass = viewModel.character.characterClass {
                            print(">>> Нажата кнопка 'Далее', выбранный класс: \(actualClass.name)")
                            viewModel.calculateHitPoints()
                            currentStep += 1
                            print(">>> currentStep теперь: \(currentStep)")
                        } else {
                            print(">>> Кнопка 'Далее' нажата, но класс is nil")
                        }
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(width: 120, height: 44)
                            .background(viewModel.character.characterClass == nil ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(viewModel.character.characterClass == nil)
                }
            }
            
            Section {
                Button(action: {
                    print(">>> Нажата кнопка 'Назад'")
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
        .onAppear {
            print(">>> Step3_ClassView появился. currentStep: \(currentStep), class: \(viewModel.character.characterClass?.name ?? "nil")")
        }
    }
}
