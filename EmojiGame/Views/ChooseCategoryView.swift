//
//  ChooseCategoryView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 31/12/2022.
//

import SwiftUI

struct ChooseCategoryView: View {
    @StateObject var realmManager = RealmManager()
    
    @Environment(\.dismiss) var dismiss
    
    private let buttonFont: Font = .title2
    private let buttonWidth: CGFloat = 210
    private let buttonHeight: CGFloat = 55
    
    
    var body: some View {
        ZStack {
            EGWaveView()
            VStack(alignment: .center, spacing: 30) {
                Image("logo_text")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding(.bottom, 30)
                Spacer().frame(height: 25)
                
                Text("CHOOSE CATEGORY")
                    .font(.title)
                    .foregroundColor(mainTextColor)
                Spacer().frame(height: 1)
                NavigationLink(
                    destination: GameView(category: "movies").environmentObject(realmManager)
                ) {
                    EGTextView(
                        text: "movies",
                        font: buttonFont,
                        textColor: mainTextColor,
                        buttonColor: mainLightColor,
                        buttonWidth: buttonWidth,
                        buttonHeight: buttonHeight
                    )
                }
                NavigationLink(
                    destination: GameView(category: "famous people").environmentObject(realmManager)
                ) {
                    EGTextView(
                        text: "famous people",
                        font: buttonFont,
                        textColor: mainTextColor,
                        buttonColor: mainDarkColor,
                        buttonWidth: buttonWidth,
                        buttonHeight: buttonHeight
                    )
                }
                NavigationLink(
                    destination: GameView(category: "TV series").environmentObject(realmManager)
                ) {
                    EGTextView(
                        text: "TV series",
                        font: buttonFont,
                        textColor: mainTextColor,
                        buttonColor: mainLightColor,
                        buttonWidth: buttonWidth,
                        buttonHeight: buttonHeight
                    )
                }
                NavigationLink(
                    destination: GameView(category: "shuffle").environmentObject(realmManager)
                ) {
                    EGTextView(
                        text: "shuffle",
                        font: .title3,
                        textColor: mainTextColor,
                        buttonColor: shuffleColor,
                        buttonWidth: 160,
                        buttonHeight: 40
                    )
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("BACK")
                        .font(.subheadline)
                        .foregroundColor(secondaryTextColor)
                }
                
                Spacer().frame(height: 95)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ChooseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCategoryView()
    }
}
