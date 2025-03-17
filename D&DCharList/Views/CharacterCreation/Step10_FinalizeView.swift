//
//  Step10_FinalizeView.swift
//  D&DCharList
//
//  Created by Артемий Андреев  on 28.01.2025.
//

import SwiftUI

struct Step10_FinalizeView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @Binding var currentStep: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            
            Section {
                HStack {
                    Button("Назад") {
                        currentStep -= 1
                    }
                    .bold()
                    .frame(width: 120, height: 44)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    
                    Spacer()
                    
                    Button("Завершить") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .bold()
                    .frame(width: 120, height: 44)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
    }
}
