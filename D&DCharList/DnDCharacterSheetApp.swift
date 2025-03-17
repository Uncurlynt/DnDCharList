//
//  DnDCharacterSheetApp.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 27.01.2025.
//

import SwiftUI

@main
struct DnDCharacterSheetApp: App {
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                CharacterSheetView(viewModel: viewModel)
                    .tabItem {
                        Label("Персонаж", systemImage: "person.fill")
                    }
                
                DiceRollerView()
                    .tabItem {
                        Label("Кубики", systemImage: "die.face.6.fill")
                    }
            }
        }
    }
}
