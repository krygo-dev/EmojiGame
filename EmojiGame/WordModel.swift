//
//  WordModel.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 25/12/2022.
//

import Foundation
import RealmSwift

class Word: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var category = ""
    @Persisted var emojis = ""
    @Persisted var correctAnswer = ""
}


let builtInPhrases: [Word] = [
    Word(value: ["category": "movies", "emojis": "πΉπΌπ§π»βπ¦±", "correctAnswer": "the pianist"]),
    Word(value: ["category": "movies", "emojis": "π§π»βπ¦±πΈπ€πΆ", "correctAnswer": "elvis"]),
    Word(value: ["category": "movies", "emojis": "π³πΌββοΈππͺπ§ββοΈ", "correctAnswer": "aladdin"]),
    Word(value: ["category": "movies", "emojis": "πΈπΌπΈπ½βοΈβοΈ", "correctAnswer": "frozen"]),
    Word(value: ["category": "movies", "emojis": "π©πΌπ§Ήπ πΈπΌ", "correctAnswer": "cinderella"]),
    Word(value: ["category": "movies", "emojis": "π©π»π‘οΈπ²πΈ", "correctAnswer": "mulan"]),
    Word(value: ["category": "movies", "emojis": "ππβοΈπ§π»ββοΈπ§π»ββοΈ", "correctAnswer": "the lord of the rings"]),
    Word(value: ["category": "movies", "emojis": "π§π»βπ¦±π¦πποΈ", "correctAnswer": "the batman"]),
    Word(value: ["category": "movies", "emojis": "π§π»βπ¦±π¦Ύπ¦Ώπ΅", "correctAnswer": "iron man"]),
    Word(value: ["category": "movies", "emojis": "π§π»βπ¦±βοΈππ»", "correctAnswer": "edward scissorhands"]),
    Word(value: ["category": "TV series", "emojis": "π¬π©πΌπ¬", "correctAnswer": "gossip girl"]),
    Word(value: ["category": "TV series", "emojis": "βππ", "correctAnswer": "the x files"]),
    Word(value: ["category": "TV series", "emojis": "π β¨β«οΈ", "correctAnswer": "orange is the new black"]),
    Word(value: ["category": "TV series", "emojis": "βοΈππ§π»βπ¦±π©πΌ", "correctAnswer": "the umbrella academy"]),
    Word(value: ["category": "TV series", "emojis": "π²π°πͺπ", "correctAnswer": "game of thrones"]),
    Word(value: ["category": "TV series", "emojis": "πππ©πΌβπ«π", "correctAnswer": "sex education"]),
    Word(value: ["category": "TV series", "emojis": "π°πͺπΈπΊ", "correctAnswer": "money heist"]),
    Word(value: ["category": "TV series", "emojis": "π§π»ββοΈβοΈπ±π»ββοΈβͺοΈ", "correctAnswer": "the witcher"]),
    Word(value: ["category": "TV series", "emojis": "πππ»π«π·", "correctAnswer": "emily in paris"]),
    Word(value: ["category": "TV series", "emojis": "πΆπΌππ?π»ββοΈ", "correctAnswer": "the walking dead"]),
    Word(value: ["category": "famous people", "emojis": "πΌοΈπ«π±π»ββοΈ", "correctAnswer": "pablo picasso"]),
    Word(value: ["category": "famous people", "emojis": "π₯π¬π΅π³", "correctAnswer": "james cameron"]),
    Word(value: ["category": "famous people", "emojis": "βοΈπ¨π»π¬", "correctAnswer": "tom cruise"]),
    Word(value: ["category": "famous people", "emojis": "πΉπΌπ΅π±π«π·", "correctAnswer": "frederic chopin"]),
    Word(value: ["category": "famous people", "emojis": "πββοΈβ‘οΈπ―π²", "correctAnswer": "usain bolt"]),
    Word(value: ["category": "famous people", "emojis": "β½οΈπββοΈ7οΈβ£π΅πΉ", "correctAnswer": "cristiano ronaldo"]),
    Word(value: ["category": "famous people", "emojis": "ππΌπΌπ", "correctAnswer": "kobe bryant"]),
    Word(value: ["category": "famous people", "emojis": "πΌοΈππ¨π¨πΌβπ¨", "correctAnswer": "leonardo da vinci"]),
    Word(value: ["category": "famous people", "emojis": "βοΈβ«οΈβͺοΈππ±π»ββοΈ", "correctAnswer": "magnus carlsen"]),
    Word(value: ["category": "famous people", "emojis": "π€πΊπ½πβ­οΈπ§πΎβπ¦±", "correctAnswer": "michael jackson"]),
]
