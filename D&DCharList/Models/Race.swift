//
//  Race.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Модель для расы персонажа
struct Race: Identifiable, Hashable {
    let id: String
    var name: String
    var abilityScoreIncreases: [AbilityName: Int]
    var traits: [String]
    
    init(name: String, abilityScoreIncreases: [AbilityName: Int], traits: [String]) {
        self.id = name
        self.name = name
        self.abilityScoreIncreases = abilityScoreIncreases
        self.traits = traits
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
    
}
