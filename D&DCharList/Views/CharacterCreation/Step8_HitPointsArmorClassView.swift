//
//  Step8_HitPointsArmorClassView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 8: Хиты и Класс Брони
struct Step8_HitPointsArmorClassView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    @State private var selectedArmor: String? = "Без брони"
    @State private var hasShield: Bool = false
    
    let armorOptions: [String] = ["Без брони", "Кожаная броня", "Кольчуга", "Латная броня"]
    
    var body: some View {
        Form {
            Section(header: Text("Выберите броню")) {
                Picker("Броня", selection: $selectedArmor) {
                    ForEach(armorOptions, id: \.self) { armor in
                        Text(armor)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: selectedArmor) { newValue in
                    print(">>> selectedArmor = \(String(describing: newValue))")
                }
            }
            
            Section(header: Text("Дополнительно")) {
                Toggle(isOn: $hasShield) {
                    Text("Использовать щит")
                }
            }
            
            Section {
                Text("Хиты: \(viewModel.character.hitPoints)")
                Text("Класс Брони: \(viewModel.character.armorClass)")
            }
            
            Section {
                HStack {
                    Button(action: {
                        viewModel.calculateArmorClass(with: selectedArmor, hasShield: hasShield)
                        currentStep += 1
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(width: 120, height: 44)
                            .background(selectedArmor == nil ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(selectedArmor == nil)
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
        .onAppear {
            print(">>> Step8_HitPointsArmorClassView. currentStep: \(currentStep). selectedArmor: \(String(describing: selectedArmor))")
        }
    }
}
