//
//  GameEndVC.swift
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
        btnHome.setTitle("ACCUEIL", for: .normal)
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
        } else {
            lblMessage.text = "Meilleure chance la prochaine fois"
            lblName.text = ""
            txtName.isHidden = true
        }
        
    }
    
    @IBAction func btnHomeTapped(_ sender: Any) {
        saveScore()  
        let controller = storyboard?.instantiateViewController(identifier: "id_HomeTabBar") as! UITabBarController
         controller.modalPresentationStyle = .fullScreen
         present(controller, animated: true, completion: nil)
    }
    
    func saveScore() {
        if hangmanGame.isWordGuessed() {
            if txtName.text != "" {
                let player: String = txtName.text!
                let mode: Int = hangmanGame.isWordDownloaderMode()! ? 1 : 2
                let score: Int = hangmanGame.getIncorrectGuessCount()
                Score.shared.createAndSaveScore(user: player, mode: mode, score: score)
            }
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
