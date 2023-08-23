//
//  WordDownloader.swift
//  ios2-labo1-pendu
//
//  Created by Mathieu Hatin (Étudiant) on 2023-08-21.
//

import Foundation

class WordDownloader {
    private var currentWord : String?
    static let shared = WordDownloader()
    private init() {}

    func fetchRandoWord(completion: @escaping (Result<String, Error>) -> Void) {
        let apiUrl = URL(string: "https://random-word-api.herokuapp.com/word?length=9")!
        
        let task = URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "com.random-word-api", code: -1, userInfo: nil)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String],
                   let randomWord = json.first {
                    completion(.success(randomWord))
                    self.printReceivedWord(randomWord) // Print the received word
                } else {
                    completion(.failure(NSError(domain: "com.random-word-api", code: -2, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func printReceivedWord(_ word: String) {
        print("Received word: \(word)")
    }
    func getCurrentWord() -> String? {
        return self.currentWord
    }

    
}
