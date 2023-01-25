//
//  RealmManager.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 25/12/2022.
//

import Foundation
import RealmSwift 


class RealmManager: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published var words: [Word] = []
    
    
    init() {
        openRealm()
        getWords()
    }
    
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    
    func addWord(word: Word) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.add(word)
                    
                    getWords()
                    print("Added new word to Realm!", word)
                }
            } catch {
                print("Error adding word to Realm: \(error)")
            }
        }
    }
    
    
    func deleteWord(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let toDelete = localRealm.objects(Word.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !toDelete.isEmpty else { return }

                try localRealm.write {
                    localRealm.delete(toDelete)
                    getWords()
                    print("Deleted: \(id)")
                }
            } catch {
                print("Error adding word to Realm: \(error)")
            }
        }
    }
    
    
    func getWords(category: String? = nil) {
        if let localRealm = localRealm {
            let allWords = localRealm.objects(Word.self)
            
            words = []
            
            if category != nil {
                let wordsFromCategory = allWords.where{ $0.category == category!.capitalized }.shuffled()

                wordsFromCategory.forEach { word in
                    words.append(word)
                }

                return
            }
            
            
            allWords.forEach { word in
                words.append(word)
            }
            
            words.shuffle()
        }
    }
}
