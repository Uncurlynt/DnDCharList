//
//  Step9_PersonalDetailsView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 9: Личные Детали
struct Step9_PersonalDetailsView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var appearance: String = ""
    @State private var alignment: Alignment = .trueNeutral
    @State private var personalityTraits: String = ""
    @State private var ideals: String = ""
    @State private var bonds: String = ""
    @State private var flaws: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Основные данные")) {
                TextField("Имя", text: $name)
                TextField("Возраст", text: $age)
                    .keyboardType(.numberPad)
                TextField("Пол", text: $gender)
                TextField("Внешность", text: $appearance)
            }
            
            Section(header: Text("Мировозрение")) {
                Picker("Мировозрение", selection: $alignment) {
                    ForEach(Alignment.allCases) { alignment in
                        Text(alignment.rawValue).tag(alignment)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            Section(header: Text("Личные Черты")) {
                TextEditor(text: $personalityTraits)
                    .frame(height: 100)
            }
            
            Section(header: Text("Идеалы")) {
                TextEditor(text: $ideals)
                    .frame(height: 100)
            }
            
            Section(header: Text("Привязанности")) {
                TextEditor(text: $bonds)
                    .frame(height: 100)
            }
            
            Section(header: Text("Недостатки")) {
                TextEditor(text: $flaws)
                    .frame(height: 100)
            }
            
            Section {
                HStack {
                    Button(action: {
                        if let ageInt = Int(age) {
                            viewModel.character.age = ageInt
                        }
                        viewModel.character.name = name
                        viewModel.character.gender = gender
                        viewModel.character.appearance = appearance
                        viewModel.character.alignment = alignment
                        viewModel.character.personalityTraits = personalityTraits
                        viewModel.character.ideals = ideals
                        viewModel.character.bonds = bonds
                        viewModel.character.flaws = flaws
                        currentStep += 1
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background((name.isEmpty || age.isEmpty || gender.isEmpty) ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(name.isEmpty || age.isEmpty || gender.isEmpty)
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
