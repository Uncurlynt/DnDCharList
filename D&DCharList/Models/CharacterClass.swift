//
//  CharacterClass.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Модель для класса персонажа
struct CharacterClass: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var primaryAbility: AbilityName
    var hitDice: String
    var proficiencies: [String]
    var features: [String]
}
