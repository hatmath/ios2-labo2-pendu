//
//  MovieStartVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class WordStartVC: UIViewController {

    var hangmanGame = HangmanGame.shared
    var wordDownloader = WordDownloader.shared
    
    @IBOutlet weak var lblAide: UILabel!
   
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func btnStart(_ sender: Any) {}
    //Pour passer un objet d'une vue à une autre voici un exemple de code *conserver pour l'instant*
    //
    //@IBAction func btnStart(_ sender: Any) {
    //    let controller = storyboard?.instantiateViewController(identifier: "MovieVC") as! MovieVC
    //    controller.hangmanGame = hangmanGame
    //    controller.modalPresentationStyle = .fullScreen
    //    present(controller, animated: true, completion: nil)
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("WordStartView did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        print ("WordStartView will appear")

        hangmanGame.fetch(usingWordDownloader: false) { success in
            if success {
                // Success handling
                DispatchQueue.main.async {
                    if self.wordDownloader.getCurrentWord() != nil {
                        self.lblAide.text = "Aide: \n" + self.wordDownloader.getCurrentWord()!
                    } else {
                        self.lblAide.text = "ERREUR: wordDownloader.getCurrentMovie()"
                    }
                }
            } else {
                // Failure handling
                DispatchQueue.main.async { self.lblAide.text = "ERREUR hangmanGame.fetch()" }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("WordStartView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("WordStartView will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("WordStartView did disappear")
    }

}

