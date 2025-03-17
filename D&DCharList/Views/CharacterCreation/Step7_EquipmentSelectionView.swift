//
//  Step7_EquipmentSelectionView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

/// Шаг 7: Выбор Снаряжения
struct Step7_EquipmentSelectionView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    let equipmentOptions: [Equipment] = [
        Equipment(name: "Меч", isEquipped: false, details: "1d8", description: "Простой меч из стали."),
        Equipment(name: "Лук", isEquipped: false, details: "1d6", description: "Длинный лук из дерева."),
        Equipment(name: "Посох", isEquipped: false, details: "1d6", description: "Магический посох."),
    ]
    
    @State private var selectedEquipment: Set<Equipment> = []
    
    var body: some View {
        Form {
            Section(header: Text("Выберите снаряжение")) {
                ForEach(equipmentOptions, id: \.self) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        if selectedEquipment.contains(item) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleSelection(of: item)
                    }
                }
            }
            
            Section {
                HStack {
                    Button(action: {
                        for equip in selectedEquipment {
                            viewModel.addEquipment(name: equip.name,
                                                   isEquipped: equip.isEquipped,
                                                   details: equip.details,
                                                   description: equip.description)
                        }
                        currentStep += 1
                    }) {
                        Text("Далее")
                            .bold()
                            .frame(width: 120, height: 44)
                            .background(selectedEquipment.isEmpty ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(selectedEquipment.isEmpty)
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
    
    private func toggleSelection(of item: Equipment) {
        if selectedEquipment.contains(item) {
            selectedEquipment.remove(item)
        } else {
            selectedEquipment.insert(item)
        }
    }
}
