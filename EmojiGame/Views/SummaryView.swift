//
//  SummaryView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 07/01/2023.
//

import SwiftUI

struct SummaryView: View {
    
    let correctAnswers: Int
    let wrongAnswers: Int
    
    private let fontSize: Font = .title3
    private let buttonFont: Font = .title2
    private let buttonWidth: CGFloat = 210
    private let buttonHeight: CGFloat = 55

    
    var body: some View {
        ZStack {
            EGWaveView()
            VStack(alignment: .center, spacing: 30) {
                VStack {
                    Image("logo_text")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(.bottom, 30)
                    Spacer().frame(height: 45)
                }
                Spacer().frame(height: 40)
                
                Text("YOUR STATS")
                    .font(.title)
                    .foregroundColor(mainTextColor)
                Spacer().frame(height: 1)
                
                HStack {
                    Text("CORRECT ANSWERS:")
                        .font(fontSize)
                        .foregroundColor(mainTextColor)
                    Text("\(correctAnswers)")
                        .font(fontSize)
                        .foregroundColor(secondaryTextColor)
                }
                Spacer().frame(height: 1)
                HStack {
                    Text("WRONG ANSWERS:")
                        .font(fontSize)
                        .foregroundColor(mainTextColor)
                    Text("\(wrongAnswers)")
                        .font(fontSize)
                        .foregroundColor(secondaryTextColor)
                }
                Spacer().frame(height: 1)

                NavigationLink(
                    destination: HomeView()
                ) {
                    EGTextView(
                        text: "PLAY AGAIN",
                        font: .title3,
                        textColor: mainTextColor,
                        buttonColor: shuffleColor,
                        buttonWidth: 180,
                        buttonHeight: 40
                    )
                }
                
                Spacer().frame(height: 160)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(correctAnswers: 8, wrongAnswers: 2)
    }
}
