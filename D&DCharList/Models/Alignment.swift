//
//  Alignment.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import Foundation

/// Перечисление для выравнивания персонажа
enum Alignment: String, CaseIterable, Identifiable {
    case lawfulGood = "Законопослушный Добрый"
    case neutralGood = "Нейтральный Добрый"
    case chaoticGood = "Хаотичный Добрый"
    case lawfulNeutral = "Законопослушный Нейтральный"
    case trueNeutral = "Истинно Нейтральный"
    case chaoticNeutral = "Хаотичный Нейтральный"
    case lawfulEvil = "Законопослушный Злой"
    case neutralEvil = "Нейтральный Злой"
    case chaoticEvil = "Хаотичный Злой"
    
    var id: String { self.rawValue }
}
