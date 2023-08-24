//
//  MovieEndVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class GameEndVC: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnHome: UIButton!
    
    var hangmanGame = HangmanGame.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MovieEndView did load")
        if hangmanGame.isWordGuessed() {
            let mode = hangmanGame.isWordDownloaderMode()! ? "Mot du dictionnaire" : "Titre de film"
            lblMessage.text =
                """
                BRAVO!!
                Votre score est:
                \(hangmanGame.getIncorrectGuessCount()) erreur(s) en \(hangmanGame.getNumberOfGuess()) tentatives
                en mode [ \(mode) ]
                """
            lblName.text =
                """
                Entrer votre nom
                pour sauvegarder votre score
                """
            txtName.text = ""
            btnHome.setTitle("ACCUEIL", for: .normal)
        } else {
            lblMessage.text = "Meilleure chance la prochaine fois"
            lblName.text = ""
            txtName.isHidden = true
            btnHome.isHidden = true
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print ("MovieEndView will appear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("MovieEndView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("MovieEndView will disappear")
        performSegue(withIdentifier: "unwindToStart", sender: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("MovieEndView did disappear")
    }
    
}
