//
//  Step5_BackgroundView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 5: Выбор бэкграунда
struct Step5_BackgroundView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    let backgrounds: [Background] = [
        Background(name: "Военный", skills: [Skill(name: "Атлетика"), Skill(name: "История")], equipment: ["Оружие", "Знак верности"], feature: "Военные связи"),
        Background(name: "Академик", skills: [Skill(name: "История"), Skill(name: "Исследование")], equipment: ["Библиотека", "Посох"], feature: "Наследие знаний"),
        Background(name: "Разбойник", skills: [Skill(name: "Скрытность"), Skill(name: "Обман")], equipment: ["Кинжал", "Инструменты взломщика"], feature: "Криминальные связи"),
    ]
    
    @State private var selectedBackground: Background?
    
    var body: some View {
        Form {
            Section(header: Text("Выберите бэкграунд")) {
                Picker("Бэкграунд", selection: $selectedBackground) {
                    ForEach(backgrounds) { background in
                        Text(background.name).tag(Optional(background))
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            if let background = selectedBackground {
                Section(header: Text("Особенности бэкграунда")) {
                    Text("Навыки:")
                    ForEach(background.skills) { skill in
                        Text(skill.name)
                    }
                    Text("Снаряжение:")
                    ForEach(background.equipment, id: \.self) { item in
                        Text(item)
                    }
                    Text("Особенность: \(background.feature)")
                }
            }
            
            Section {
                HStack {
                    Button(action: {
                        if let background = selectedBackground {
                            viewModel.character.background = background
                            viewModel.character.skills.append(contentsOf: background.skills)
                            for item in background.equipment {
                                viewModel.addEquipment(name: item, isEquipped: false, details: "", description: "")
                            }
                            currentStep += 1
                        }
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(width: 120, height: 44)
                            .background(selectedBackground == nil ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(selectedBackground == nil)
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
