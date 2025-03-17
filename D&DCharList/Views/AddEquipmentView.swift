//
//  AddEquipmentView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import SwiftUI

/// Экран Добавления Снаряжения
struct AddEquipmentView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CharacterViewModel
    
    @State private var name: String = ""
    @State private var isEquipped: Bool = false
    @State private var details: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Название")) {
                    TextField("Название снаряжения", text: $name)
                }
                
                Section(header: Text("Экипировано")) {
                    Toggle(isOn: $isEquipped) {
                        Text("Экипировано")
                    }
                }
                
                Section(header: Text("Характеристики")) {
                    TextField("Характеристики", text: $details)
                        .keyboardType(.default)
                }
                
                Section(header: Text("Описание")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                }
            }
            .navigationBarTitle("Добавить Снаряжение", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Отмена") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Сохранить") {
                    saveEquipment()
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(name.isEmpty || details.isEmpty)
            )
        }
    }
    
    private func saveEquipment() {
        viewModel.addEquipment(name: name, isEquipped: isEquipped, details: details, description: description)
    }
}
