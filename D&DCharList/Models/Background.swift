//
//  Background.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Модель для бэкграунда персонажа
struct Background: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var skills: [Skill]
    var equipment: [String]
    var feature: String
}
