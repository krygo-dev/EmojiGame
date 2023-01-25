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
    Word(value: ["category": "movies", "emojis": "🎹🎼🧑🏻‍🦱", "correctAnswer": "the pianist"]),
    Word(value: ["category": "movies", "emojis": "🧑🏻‍🦱🎸🎤🎶", "correctAnswer": "elvis"]),
    Word(value: ["category": "movies", "emojis": "👳🏼‍♀️🐒🪔🧞‍♂️", "correctAnswer": "aladdin"]),
    Word(value: ["category": "movies", "emojis": "👸🏼👸🏽❄️⛄️", "correctAnswer": "frozen"]),
    Word(value: ["category": "movies", "emojis": "👩🏼🧹👠👸🏼", "correctAnswer": "cinderella"]),
    Word(value: ["category": "movies", "emojis": "👩🏻🗡️🐲🌸", "correctAnswer": "mulan"]),
    Word(value: ["category": "movies", "emojis": "💍👑⚔️🧙🏻‍♂️🧝🏻‍♂️", "correctAnswer": "the lord of the rings"]),
    Word(value: ["category": "movies", "emojis": "🧑🏻‍🦱🦇🌑🏎️", "correctAnswer": "the batman"]),
    Word(value: ["category": "movies", "emojis": "🧑🏻‍🦱🦾🦿💵", "correctAnswer": "iron man"]),
    Word(value: ["category": "movies", "emojis": "🧑🏻‍🦱✂️👐🏻", "correctAnswer": "edward scissorhands"]),
    Word(value: ["category": "TV series", "emojis": "💬👩🏼💬", "correctAnswer": "gossip girl"]),
    Word(value: ["category": "TV series", "emojis": "❌📂📂", "correctAnswer": "the x files"]),
    Word(value: ["category": "TV series", "emojis": "🟠✨⚫️", "correctAnswer": "orange is the new black"]),
    Word(value: ["category": "TV series", "emojis": "☂️🎓🧑🏻‍🦱👩🏼", "correctAnswer": "the umbrella academy"]),
    Word(value: ["category": "TV series", "emojis": "🎲🏰🪑👑", "correctAnswer": "game of thrones"]),
    Word(value: ["category": "TV series", "emojis": "🍆🍑👩🏼‍🏫📚", "correctAnswer": "sex education"]),
    Word(value: ["category": "TV series", "emojis": "💰🇪🇸👺", "correctAnswer": "money heist"]),
    Word(value: ["category": "TV series", "emojis": "🧙🏻‍♀️⚔️👱🏻‍♂️⚪️", "correctAnswer": "the witcher"]),
    Word(value: ["category": "TV series", "emojis": "👗💋💻🇫🇷", "correctAnswer": "emily in paris"]),
    Word(value: ["category": "TV series", "emojis": "🚶🏼💀👮🏻‍♂️", "correctAnswer": "the walking dead"]),
    Word(value: ["category": "famous people", "emojis": "🖼️🔫👱🏻‍♂️", "correctAnswer": "pablo picasso"]),
    Word(value: ["category": "famous people", "emojis": "🎥🎬🔵🐳", "correctAnswer": "james cameron"]),
    Word(value: ["category": "famous people", "emojis": "✈️👨🏻🎬", "correctAnswer": "tom cruise"]),
    Word(value: ["category": "famous people", "emojis": "🎹🎼🇵🇱🇫🇷", "correctAnswer": "frederic chopin"]),
    Word(value: ["category": "famous people", "emojis": "🏃‍♂️⚡️🇯🇲", "correctAnswer": "usain bolt"]),
    Word(value: ["category": "famous people", "emojis": "⚽️🏃‍♂️7️⃣🇵🇹", "correctAnswer": "cristiano ronaldo"]),
    Word(value: ["category": "famous people", "emojis": "🏀👼🏼🚁", "correctAnswer": "kobe bryant"]),
    Word(value: ["category": "famous people", "emojis": "🖼️📜🔨👨🏼‍🎨", "correctAnswer": "leonardo da vinci"]),
    Word(value: ["category": "famous people", "emojis": "♟️⚫️⚪️👑👱🏻‍♂️", "correctAnswer": "magnus carlsen"]),
    Word(value: ["category": "famous people", "emojis": "🎤🕺🏽👑⭐️🧑🏾‍🦱", "correctAnswer": "michael jackson"]),
]
