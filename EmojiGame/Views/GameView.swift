//
//  GameView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 25/12/2022.
//

import SwiftUI
import RealmSwift

struct GameView: View {
    @EnvironmentObject var realmManager: RealmManager
    let category: String
    
    @ObservedResults(
        Word.self,
        where: ({ $0.category == "movies" }
    )) var moviesList
    
    @ObservedResults(
        Word.self,
        where: ({ $0.category == "famous people" }
    )) var famousPeopleList
    
    @ObservedResults(
        Word.self,
        where: ({ $0.category == "TV series" }
    )) var tvSeriesList
    
    @ObservedResults(Word.self) var shuffleList
    
    @Environment(\.dismiss) var dismiss
    
    @State private var viewDidLoad: Bool = false
    @State private var showAlert: Bool = false
    
    @State private var gameOver: Bool = false
    @State private var isCorrect: Bool = false
    @State private var words: [Word] = []
    @State private var currentWord: Int = 0
    @State private var attemptsLeft: Int = 3
    @State private var correctAnswersCount: Int = 0
    @State private var answer: String = ""
    
    
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
                
                if words.isEmpty {
                    Text("NO PHRASES IN THIS CATEGORY")
                        .font(.title)
                        .foregroundColor(mainTextColor)
                    
                    Spacer().frame(height: 1)
                    
                    EGTextView(
                        text: "",
                        font: .title2,
                        textColor: mainTextColor,
                        buttonColor: waveColor,
                        buttonWidth: 210,
                        buttonHeight: 55)
                } else {
                    Text(words[currentWord].category.uppercased())
                        .font(.title)
                        .foregroundColor(mainTextColor)
                    
                    Spacer().frame(height: 1)
                    
                    EGTextView(
                        text: words[currentWord].emojis,
                        font: .title2,
                        textColor: mainTextColor,
                        buttonColor: waveColor,
                        buttonWidth: 210,
                        buttonHeight: 55)
                }
                
                VStack {
                    EGTextFieldView(
                        value: $answer,
                        placeholder: "enter answer",
                        fieldWidth: 210,
                        fieldHeight: 55,
                        placeholderColor: secondaryTextColor,
                        textColor: mainTextColor,
                        backgroundColor: mainLightColor)
                    
                    Text("\(attemptsLeft) attempts left")
                        .foregroundColor(secondaryTextColor)
                }
                
                Spacer().frame(height: 10)
                
                if gameOver {
                    NavigationLink(
                        destination: SummaryView(
                            correctAnswers: correctAnswersCount,
                            wrongAnswers: 3 - attemptsLeft
                        )
                    ) {
                        EGTextView(
                            text: "FINISH",
                            font: .title3,
                            textColor: mainTextColor,
                            buttonColor: shuffleColor,
                            buttonWidth: 160,
                            buttonHeight: 40
                        )
                    }
                } else {
                    Button {
                        checkAnswer()
                    } label: {
                        EGTextView(
                            text: "OK",
                            font: .title3,
                            textColor: mainTextColor,
                            buttonColor: shuffleColor,
                            buttonWidth: 160,
                            buttonHeight: 40)
                    }
                    .alert(isCorrect ? Text("Correct answer 🤩") : Text("Wrong answer 🤭"), isPresented: $showAlert) {
                        Button("OK", role: .cancel) {
                            if attemptsLeft <= 0 || currentWord >= words.count - 1{
                                gameOver = true
                            }
                            
                            if currentWord < words.count - 1 {
                                currentWord += 1
                            }
                        }
                    }
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("BACK")
                        .font(.subheadline)
                        .foregroundColor(secondaryTextColor)
                }

                Spacer().frame(height: 100)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if !viewDidLoad {
                viewDidLoad = true
                prepareList()
            }
        }
    }
    
    func checkAnswer() {
        isCorrect = false
        
        if !answer.isEmpty && answer.lowercased() == words[currentWord].correctAnswer {
            isCorrect = true
            correctAnswersCount += 1
        } else {
            isCorrect = false
            attemptsLeft -= 1
        }
        
        showAlert = true
        answer = ""
    }
    
    
    func prepareList() {
        words = []
        switch category {
        case "movies":
            moviesList.forEach { movie in
                words.append(movie)
            }
        case "famous people":
            famousPeopleList.forEach { famousPerson in
                words.append(famousPerson)
            }
        case "TV series":
            tvSeriesList.forEach { tvSeries in
                words.append(tvSeries)
            }
        default:
            shuffleList.forEach { word in
                words.append(word)
            }
        }

        words.shuffle()
        words = Array(words[0...9])
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(category: "movies")
            .environmentObject(RealmManager())
    }
}
