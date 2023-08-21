//
//  HangmanGame.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit
import Foundation


class HangmanGame {
    private let word: String
    private var guessedWord: [Character]
    private var incorrectGuessCount = 0
    private var selectedLetters: Set<Character> = []
    private var numberOfGuess = 7

    init(word: String) {
        self.word = word.uppercased()
        self.guessedWord = Array(repeating: "_", count: word.count)
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
            return "Aucun indice"
          case 2:
            return
                """
                Indice:
                Année de production: \(aMovie.Released)
                """
          case 3:
            return "Aucun indice pour l'instant"
          case 4:
            return
                """
                Indices:
                Classé: \(aMovie.Rated)
                Genre: \(aMovie.Genre)
                """
          case 5:
            return
                """
                Indices                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          :
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
        switch self.getIncorrectGuessCount() {
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
