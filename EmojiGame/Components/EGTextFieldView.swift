//
//  EGTextFieldView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 31/12/2022.
//

import SwiftUI

struct EGTextFieldView: View {
        
    @Binding var value: String
    let placeholder: String
    let fieldWidth: CGFloat
    let fieldHeight: CGFloat
    let placeholderColor: Color
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        TextField("", text: $value, prompt: Text(placeholder).foregroundColor(placeholderColor))
            .padding()
            .frame(width: fieldWidth, height: fieldHeight)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .textCase(.lowercase)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.title2)
            .cornerRadius(30)
    }
}
