//
//  EquipmentDetailView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import SwiftUI

/// Экран деталей снаряжения
struct EquipmentDetailView: View {
    var equipment: Equipment
    
    var body: some View {
        Form {
            Section(header: Text("Название")) {
                Text(equipment.name)
                    .font(.title)
            }
            
            Section(header: Text("Экипировано")) {
                Text(equipment.isEquipped ? "Да" : "Нет")
            }
            
            Section(header: Text("Характеристики")) {
                Text(equipment.details)
            }
            
            Section(header: Text("Описание")) {
                Text(equipment.description)
            }
        }
        .navigationBarTitle("Детали Снаряжения", displayMode: .inline)
    }
}
