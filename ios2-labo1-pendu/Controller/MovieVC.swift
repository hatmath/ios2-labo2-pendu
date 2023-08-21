//
//  MovieVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class MovieVC: UIViewController {

    @IBOutlet weak var txtFieldUneLettre: UITextField!
    @IBOutlet weak var txtFieldLesLettres: UITextField!
    @IBOutlet weak var btnValider: UIButton!
    @IBOutlet weak var lblDevinette: UILabel!
    @IBOutlet weak var imgViewPendu: UIImageView!
    @IBOutlet weak var lblPointage: UILabel!
    @IBOutlet weak var btnRejouer: UIButton!
    @IBOutlet weak var lblBravo: UILabel!
    
    var hangmanGameCopy: HangmanGame!
    var movieDownloader = MovieDownloader.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("MovieView will appear")
        
        // Do any additional setup after loading the view.
        txtFieldUneLettre.text = ""
        txtFieldLesLettres.text = ""
        lblPointage.text = ""
        btnRejouer.isHidden = false
        lblBravo.text = ""
        imgViewPendu.image = UIImage(named: "0_echafaud")
        lblDevinette.text = hangmanGameCopy.getGuessedWord()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print ("MovieView will appear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("MovieView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("MovieView will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("MovieView did disappear")
    }    

    @IBAction func pushValider(_ sender: Any) {
        
        if hangmanGameCopy.getIncorrectGuessCount() < hangmanGameCopy.getNumberOfGuess() {
            if let letter = txtFieldUneLettre.text?.first {

                // Make a guess using the HangmanGame instance
                hangmanGameCopy.makeGuess(letter: letter)

                imgViewPendu.image = UIImage(named: hangmanGameCopy.getCurrentImageName())!
                
                // Update UI elements
                txtFieldLesLettres.text = hangmanGameCopy.getSelectedLetters().sorted().map { String($0) }.joined(separator: ", ")
                lblPointage.text = "Pointage: \(hangmanGameCopy.getIncorrectGuessCount())/\(hangmanGameCopy.getNumberOfGuess() )"
                lblDevinette.text = hangmanGameCopy.getGuessedWord()

                lblBravo.text = hangmanGameCopy.getAHint(aMovie: movieDownloader.getCurrentMovie())
                                                     
                if hangmanGameCopy.isWordGuessed() {
                    // update UI
                    lblBravo.text = "BRAVO !!"
                }
                
                if hangmanGameCopy.isGameOver() {
                    // Game over
                    btnRejouer.isHidden = false
                }
            }
        }

        txtFieldUneLettre.text = ""
    }

    @IBAction func pushRejouer(_ sender: Any) {
        viewDidLoad()
    }
    
}
