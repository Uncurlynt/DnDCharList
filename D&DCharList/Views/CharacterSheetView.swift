//
//  CharacterSheetView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import SwiftUI

/// Экран Листа Персонажа
struct CharacterSheetView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @State private var showingAddEquipment = false
    @State private var showingCharacterCreation = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Основная информация")) {
                    Text("Имя: \(viewModel.character.name)")
                    Text("Возраст: \(viewModel.character.age)")
                    Text("Пол: \(viewModel.character.gender)")
                    Text("Внешность: \(viewModel.character.appearance)")
                    Text("Мировозрение: \(viewModel.character.alignment.rawValue)")
                }
                
                Section(header: Text("Концепция")) {
                    Text(viewModel.character.concept)
                }
                
                Section(header: Text("Раса и Класс")) {
                    Text("Раса: \(viewModel.character.race?.name ?? "Не выбрана")")
                    Text("Класс: \(viewModel.character.characterClass?.name ?? "Не выбран")")
                    Text("Бэкграунд: \(viewModel.character.background?.name ?? "Не выбран")")
                }
                
                Section(header: Text("Характеристики")) {
                    ForEach(viewModel.character.abilityScores) { ability in
                        HStack {
                            Text(ability.name.rawValue)
                            Spacer()
                            Text("\(ability.score) (\(ability.modifier >= 0 ? "+" : "")\(ability.modifier))")
                        }
                    }
                }
                
                Section(header: Text("Навыки")) {
                    Text(viewModel.character.skills.map { $0.name }.joined(separator: ", "))
                }
                
                Section(header: Text("Хиты и Класс Брони")) {
                    Text("Хиты: \(viewModel.character.hitPoints)")
                    Text("Класс Брони: \(viewModel.character.armorClass)")
                }
                
                Section(header: Text("Снаряжение")) {
                    List {
                        ForEach(viewModel.character.equipment) { equipment in
                            NavigationLink(destination: EquipmentDetailView(equipment: equipment)) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(equipment.name)
                                            .font(.headline)
                                        Text(equipment.details)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Toggle(isOn: Binding(
                                        get: { equipment.isEquipped },
                                        set: { newValue in
                                            if let index = viewModel.character.equipment.firstIndex(where: { $0.id == equipment.id }) {
                                                viewModel.character.equipment[index].isEquipped = newValue
                                            }
                                        }
                                    )) {
                                        Text("Экипировано")
                                    }
                                    .labelsHidden()
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeEquipment)
                    }
                }
                
                Section(header: Text("Личные черты")) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Личные черты: \(viewModel.character.personalityTraits)")
                        Text("Идеалы: \(viewModel.character.ideals)")
                        Text("Привязанности: \(viewModel.character.bonds)")
                        Text("Недостатки: \(viewModel.character.flaws)")
                    }
                }
            }
            .navigationBarTitle("Лист персонажа", displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing: HStack {
                    Button(action: {
                        showingCharacterCreation = true
                    }) {
                        Image(systemName: "plus")
                    }
                    
                    Button(action: {
                        showingAddEquipment = true
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
            )
            .sheet(isPresented: $showingAddEquipment) {
                AddEquipmentView(viewModel: viewModel)
            }
            .sheet(isPresented: $showingCharacterCreation) {
                CharacterCreationView(viewModel: viewModel)
            }
        }
    }
}
