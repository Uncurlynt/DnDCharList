//
//  Equipment.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import Foundation

/// Модель снаряжения
struct Equipment: Identifiable, Hashable { 
    let id = UUID()
    var name: String
    var isEquipped: Bool
    var details: String
    var description: String  
}
