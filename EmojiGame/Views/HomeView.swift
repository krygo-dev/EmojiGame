//
//  HomeView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 25/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var didViewLoad = false
    
    let buttonFont: Font = .title2
    let buttonWidth: CGFloat = 210
    let buttonHeight: CGFloat = 55
    
    var body: some View {
        NavigationView {
            ZStack {
                EGWaveView()
                VStack(alignment: .center, spacing: 30) {
                    VStack {
                        Image("logo_with_img")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .padding(.bottom, 30)
                        Spacer().frame(height: 50)
                    }
                    Spacer().frame(height: 10)
                    NavigationLink(
                        destination: ChooseCategoryView()
                    ) {
                        EGTextView(
                            text: "new game",
                            font: buttonFont,
                            textColor: mainTextColor,
                            buttonColor: mainLightColor,
                            buttonWidth: buttonWidth,
                            buttonHeight: buttonHeight
                        )
                    }
                    
                    NavigationLink(
                        destination: AddPhraseView().environmentObject(realmManager)
                    ) {
                        EGTextView(
                            text: "add phrases",
                            font: buttonFont,
                            textColor: mainTextColor,
                            buttonColor: mainDarkColor,
                            buttonWidth: buttonWidth,
                            buttonHeight: buttonHeight
                        )
                    }
                    Spacer().frame(height: 30)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if !didViewLoad {
                didViewLoad = true
                if realmManager.words.isEmpty {
                    builtInPhrases.forEach { phrase in
                        realmManager.addWord(word: phrase)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
