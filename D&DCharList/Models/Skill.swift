//
//  Skill.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Модель для навыка
struct Skill: Identifiable, Hashable {
    let id = UUID()
    var name: String
}
