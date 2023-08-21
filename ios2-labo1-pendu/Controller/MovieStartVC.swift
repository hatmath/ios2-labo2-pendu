//
//  MovieStartVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class MovieStartVC: UIViewController {

    var hangmanGame: HangmanGame!
    var movieDownloader = MovieDownloader.shared
    
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue) {}
    
    func fetchRandomMovieTitle() {
        movieDownloader.fetchRandomMovie { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.hangmanGame = HangmanGame(word: movie.Title.uppercased())
                }
            case .failure(let error):
                print("Error fetching movie title: \(error)")
                // Handle error if needed
            }
        }
    }
    
    @IBAction func btnStart(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "MovieVC") as! MovieVC
        controller.hangmanGameCopy = hangmanGame
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("MovieStartView did load")
        fetchRandomMovieTitle()
    }

    override func viewWillAppear(_ animated: Bool) {
        print ("MovieStartView will appear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("MovieStartView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("MovieStartView will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("MovieStartView did disappear")
    }

}
