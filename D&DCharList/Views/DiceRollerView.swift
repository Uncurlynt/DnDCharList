//
//  DiceRollerView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import SwiftUI

/// Экран Броска Кубиков
struct DiceRollerView: View {
    @State private var selectedDice = "d6"
    @State private var diceCount = 1
    @State private var rollResults: [Int] = []
    
    let diceOptions = ["d4", "d6", "d8", "d10", "d12", "d20"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Выбор кубика")) {
                        Picker("Тип кубика", selection: $selectedDice) {
                            ForEach(diceOptions, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Количество кубиков")) {
                        Stepper("\(diceCount)", value: $diceCount, in: 1...20)
                    }
                    
                    Section {
                        Button(action: rollDice) {
                            Text("Бросить")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    
                    if !rollResults.isEmpty {
                        Section(header: Text("Результаты")) {
                            Text("Результаты броска: \(rollResults.map { String($0) }.joined(separator: ", "))")
                            Text("Сумма: \(rollResults.reduce(0, +))")
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .navigationBarTitle("Бросок кубиков", displayMode: .inline)
        }
    }
    
    private func diceMaxValue(dice: String) -> Int {
        switch dice {
        case "d4": return 4
        case "d6": return 6
        case "d8": return 8
        case "d10": return 10
        case "d12": return 12
        case "d20": return 20
        default: return 6
        }
    }
    
    /// Логика броска кубиков
    private func rollDice() {
        let maxValue = diceMaxValue(dice: selectedDice)
        var results: [Int] = []
        for _ in 1...diceCount {
            let roll = Int.random(in: 1...maxValue)
            results.append(roll)
        }
        rollResults = results
    }
}

