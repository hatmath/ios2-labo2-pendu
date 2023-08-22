//
//  HangmanGame.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit
import Foundation

class HangmanGame {
    private var word: String = ""
    private var guessedWord: [Character] = []
    private var incorrectGuessCount = 0
    private var selectedLetters: Set<Character> = []
    private var numberOfGuess = 7
    
    static let shared = HangmanGame()
    private init() {}
    
    func fetch(usingWordDownloader: Bool, completion: @escaping (Bool) -> Void) {
        if usingWordDownloader {
            WordDownloader.shared.fetchRandoWord { result in
                switch result {
                case .success(let item):
                    self.word = item.uppercased()
                    self.guessedWord = Array(repeating: "_", count: item.count)
                    completion(true) // Indicate success
                    
                case .failure(let error):
                    print("Error fetching word: \(error)")
                    self.word = "DEFAULT"
                    self.guessedWord = Array(repeating: "_", count: 7)
                    completion(false) // Indicate failure
                }
            }
        } else {
            MovieDownloader.shared.fetchRandomMovie { result in
                switch result {
                case .success(let item):
                    self.word = item.Title.uppercased()
                    self.guessedWord = Array(repeating: "_", count: item.Title.count)
                    completion(true) // Indicate success

                case .failure(let error):
                    print("Error fetching movie title: \(error)")
                    self.word = "DEFAULT"
                    self.guessedWord = Array(repeating: "_", count: 7)
                    completion(false) // Indicate failure
                }
            }
        }
    }
    
    func makeGuess(letter: Character) {
        let uppercasedLetter = Character(letter.uppercased())
        guard !selectedLetters.contains(uppercasedLetter) else {
            return // Letter has already been guessed
        }
        
        selectedLetters.insert(uppercasedLetter)
        
        if word.contains(uppercasedLetter) {
            for (index, char) in word.enumerated() {
                if char == uppercasedLetter {
                    guessedWord[index] = char
                }
            }
        } else {
            incorrectGuessCount += 1
        }
    }
    
    func getAHint(aMovie: Movie) -> String {
        switch self.getIncorrectGuessCount() {
        case 0:
            return "Aucun indice pour l'instant"
        case 1:
            return "Un indice s'en vient"
        case 2:
            return """
            Indice:
            Année de production: \(aMovie.Released)
            """
        case 3:
            return "Aucun indice pour l'instant"
        case 4:
            return """
            Indices:
            Classé: \(aMovie.Rated)
            Genre: \(aMovie.Genre)
            """
        case 5:
            return """
            Indices
            Réalisateur(s): \(aMovie.Director)
            Acteur(s): \(aMovie.Actors)
            """
        case 6:
            return "Vous avez utilisé tout vos indices"
        case 7:
            return "Vous avez utilisé tout vos indices"
        default:
            return "Aucun indice"
        }
    }
    
    func isWordGuessed() -> Bool {
        return guessedWord == Array(word)
    }
    
    func isGameOver() -> Bool {
        return incorrectGuessCount >= numberOfGuess || isWordGuessed()
    }
    
    func getGuessedWord() -> String {
        return guessedWord.map { String($0) }.joined(separator: " ")
    }
    
    func getNumberOfGuess() -> Int {
        return numberOfGuess
    }
    
    func getIncorrectGuessCount() -> Int {
        return incorrectGuessCount
    }
    
    func getSelectedLetters() -> Set<Character> {
        return selectedLetters
    }
    
    func getCurrentImageName() -> String {
        switch getIncorrectGuessCount() {
        case 0:
            return "0_echafaud"
        case 1:
            return "1_tete"
        case 2:
            return "2_corps"
        case 3:
            return "3_bras_gauche"
        case 4:
            return "4_bras_droit"
        case 5:
            return "5_jambe_gauche"
        case 6:
            return "6_jambe_droite"
        case 7:
            return "7_final"
        default:
            return "7_final"
        }
        
    }
}

