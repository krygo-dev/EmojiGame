//
//  EGTextView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 31/12/2022.
//

import SwiftUI

struct EGTextView: View {
    
    let text: String
    let font: Font
    let textColor: Color
    let buttonColor: Color
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    
    var body: some View {
        Text(text)
            .font(font)
            .padding()
            .padding(.horizontal)
            .frame(width: buttonWidth, height: buttonHeight)
            .foregroundColor(textColor)
            .background(buttonColor)
            .cornerRadius(30)
    }
}

struct EGTextView_Previews: PreviewProvider {
    static var previews: some View {
        EGTextView(
            text: "shuffle",
            font: .title2,
            textColor: mainTextColor,
            buttonColor: shuffleColor,
            buttonWidth: 160,
            buttonHeight: 40
        )
    }
}
