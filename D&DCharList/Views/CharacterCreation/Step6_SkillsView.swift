//
//  Step6_SkillsView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 6: Выбор Навыков
struct Step6_SkillsView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    let allSkills: [Skill] = [
        Skill(name: "Атлетика"),
        Skill(name: "Акробатика"),
        Skill(name: "Скрытность"),
        Skill(name: "Обман"),
        Skill(name: "История"),
        Skill(name: "Исследование"),
        Skill(name: "Восприятие"),
        Skill(name: "Магия"),
    ]
    
    @State private var selectedSkills: Set<Skill> = []
    
    var body: some View {
        Form {
            Section(header: Text("Выберите навыки")) {
                ForEach(allSkills, id: \.self) { skill in
                    HStack {
                        Text(skill.name)
                        Spacer()
                        if selectedSkills.contains(skill) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleSelection(for: skill)
                    }
                }
            }
            Section {
                Button(action: {
                    viewModel.character.skills.append(contentsOf: selectedSkills)
                    currentStep += 1
                }) {
                    Text("Далее")
                        .bold()
                        .frame(width: 100, height: 44)
                        .background(selectedSkills.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(selectedSkills.isEmpty)
            }
            
            Section {
                HStack {
                    Button(action: {
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
        }
        .onAppear {
            print(">>> Step6_SkillsView появился. currentStep: \(currentStep). Уже есть навыков: \(viewModel.character.skills.count)")
        }
    }
    
    private func toggleSelection(for skill: Skill) {
        if selectedSkills.contains(skill) {
            selectedSkills.remove(skill)
        } else {
            selectedSkills.insert(skill)
        }
    }
}
