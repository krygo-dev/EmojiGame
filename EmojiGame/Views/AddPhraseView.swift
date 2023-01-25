//
//  AddPhraseView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 25/12/2022.
//

import SwiftUI

struct AddPhraseView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showAlert = false
    @State private var added = false
    @State private var category: String = ""
    @State private var emojis: String = ""
    @State private var answer: String = ""
    
    private let fieldWidth: CGFloat = 210
    private let fieldHeight: CGFloat = 55
    
    private let categories = ["movies", "famous people", "TV series"]
    
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
                Text("ADD PHRASES")
                    .font(.title)
                    .foregroundColor(mainTextColor)
                Spacer().frame(height: 1)
                
                Picker(selection: $category, label: Text("Select category")) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                            .font(.title2)
                            .foregroundColor(mainTextColor)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 210, height: 55)
                .background(mainDarkColor)
                .cornerRadius(30)
                
            
                EGTextFieldView(
                    value: $emojis,
                    placeholder: "emojis",
                    fieldWidth: fieldWidth,
                    fieldHeight: fieldHeight,
                    placeholderColor: secondaryTextColor,
                    textColor: mainTextColor,
                    backgroundColor: accentLightColor)
                
                EGTextFieldView(
                    value: $answer,
                    placeholder: "answer",
                    fieldWidth: fieldWidth,
                    fieldHeight: fieldHeight,
                    placeholderColor: secondaryTextColor,
                    textColor: mainTextColor,
                    backgroundColor: mainLightColor)
                    
                Button {
                    if category != "" && emojis != "" && answer != "" {
                        
                        if emojis.count > 5 {
                            added = false
                            showAlert = true
                            return
                        }
                        
                        let word = Word(value: [
                            "category": category,
                            "emojis": emojis.lowercased(),
                            "correctAnswer": answer.lowercased()
                        ])
                        realmManager.addWord(word: word)
                        added = true
                        showAlert = true

                        category = ""
                        emojis = ""
                        answer = ""
                    } else {
                        added = false
                        showAlert = true
                    }
                } label: {
                    EGTextView(
                        text: "ADD",
                        font: .title3,
                        textColor: mainTextColor,
                        buttonColor: shuffleColor,
                        buttonWidth: 160,
                        buttonHeight: 40)
                }
                .alert(added ? Text("PHRASE ADDED") : Text("TRY AGAIN"), isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
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

struct AddPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhraseView()
            .environmentObject(RealmManager())
    }
}
