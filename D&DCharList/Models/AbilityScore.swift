//
//  AbilityScore.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Модель для хранения информации о характеристике
struct AbilityScore: Identifiable {
    let id = UUID()
    var name: AbilityName
    var score: Int
    
    var modifier: Int {
        return (score - 10) / 2
    }
}

/// Перечисление для названий характеристик
enum AbilityName: String, CaseIterable, Identifiable, Hashable {
    case strength = "Сила"
    case dexterity = "Ловкость"
    case constitution = "Телосложение"
    case intelligence = "Интеллект"
    case wisdom = "Мудрость"
    case charisma = "Харизма"
    
    var id: String { self.rawValue }
}
