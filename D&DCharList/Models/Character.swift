//
//  Character.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Модель персонажа
struct Character {
    // Шаг 1: Концепция
    var concept: String = ""
    
    // Шаг 2: Раса
    var race: Race?
    
    // Шаг 3: Класс
    var characterClass: CharacterClass?
    
    // Шаг 4: Характеристики
    var abilityScores: [AbilityScore] = AbilityName.allCases.map { AbilityScore(name: $0, score: 10) }
    
    // Шаг 5: Бэкграунд
    var background: Background?
    
    // Шаг 6: Навыки
    var skills: [Skill] = []
    
    // Шаг 7: Снаряжение
    var equipment: [Equipment] = []
    
    // Шаг 8: Хиты и Класс Брони
    var hitPoints: Int = 0
    var armorClass: Int = 10
    
    // Шаг 9: Личные Детали
    var name: String = ""
    var age: Int = 0
    var gender: String = ""
    var appearance: String = ""
    var alignment: Alignment = .trueNeutral
    var personalityTraits: String = ""
    var ideals: String = ""
    var bonds: String = ""
    var flaws: String = ""
    
}
