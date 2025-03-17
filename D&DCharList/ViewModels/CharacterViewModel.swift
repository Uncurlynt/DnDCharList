//
//  CharacterViewModel.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import Foundation
import Combine

/// ViewModel для хранения и изменения данных персонажа
class CharacterViewModel: ObservableObject {
    @Published var character: Character = Character()
    
    /// Метод для добавления нового снаряжения
    func addEquipment(name: String, isEquipped: Bool, details: String, description: String) {
        let newEquipment = Equipment(name: name, isEquipped: isEquipped, details: details, description: description)
        character.equipment.append(newEquipment)
        print(">>> Добавлено снаряжение: \(newEquipment.name)")
    }
    
    /// Метод для удаления снаряжения
    func removeEquipment(at offsets: IndexSet) {
        character.equipment.remove(atOffsets: offsets)
        print(">>> Снаряжение удалено")
    }
    
    /// Метод для обновления характеристик (например, после выбора расы)
    func updateAbilityScores(with race: Race) {
        print(">>> updateAbilityScores вызван для расы: \(race.name)")
        for (ability, bonus) in race.abilityScoreIncreases {
            if let index = character.abilityScores.firstIndex(where: { $0.name == ability }) {
                character.abilityScores[index].score += bonus
                print(">>> Добавлен бонус \(bonus) к \(ability.rawValue). Новый счет: \(character.abilityScores[index].score)")
            }
        }
    }
    
    /// Метод для расчета хитов
    func calculateHitPoints() {
        guard let characterClass = character.characterClass else { return }
        let baseHP: Int
        switch characterClass.name.lowercased() {
        case "fighter":
            baseHP = 10
        case "wizard":
            baseHP = 6
        case "cleric":
            baseHP = 8
        case "rogue":
            baseHP = 8
        case "barbarian":
            baseHP = 12
        case "bard":
            baseHP = 8
        case "druid":
            baseHP = 8
        case "paladin":
            baseHP = 10
        case "sorcerer":
            baseHP = 6
        case "monk":
            baseHP = 8
        case "warlock":
            baseHP = 8
        case "ranger":
            baseHP = 10
        case "artificer":
            baseHP = 8
        default:
            baseHP = 6
        }
        let constitutionModifier = getAbilityModifier(.constitution)
        character.hitPoints = baseHP + constitutionModifier
        print(">>> Hit Points рассчитаны: \(character.hitPoints)")
    }
    
    /// Метод для расчета класса брони
    func calculateArmorClass(with armor: String? = nil, hasShield: Bool = false) {
        var baseAC = 10
        if let armor = armor {
            switch armor.lowercased() {
            case "leather":
                baseAC = 11 + getAbilityModifier(.dexterity)
            case "chain mail":
                baseAC = 16
            case "scale mail":
                baseAC = 14 + getAbilityModifier(.dexterity)
            case "plate":
                baseAC = 18
            default:
                baseAC = 10 + getAbilityModifier(.dexterity)
            }
        } else {
            baseAC = 10 + getAbilityModifier(.dexterity)
        }
        
        if hasShield {
            baseAC += 2
        }
        
        character.armorClass = baseAC
        print(">>> Armor Class рассчитан: \(character.armorClass)")
    }
    
    /// Метод для получения модификатора характеристики
    func getAbilityModifier(_ ability: AbilityName) -> Int {
        if let abilityScore = character.abilityScores.first(where: { $0.name == ability }) {
            return abilityScore.modifier
        }
        return 0
    }
}
