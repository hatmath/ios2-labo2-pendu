//
//  ScoreTestingVC.swift
//  ios2-labo1-pendu
//
//  Created by Mathieu Hatin (Étudiant) on 2023-08-24.
//

import UIKit

class ScoreTestingVC: UIViewController {
    
    @IBOutlet weak var txtScore: UITextField!
    @IBOutlet weak var txtMode: UITextField!
    @IBOutlet weak var txtPlayer: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBAction func savePush(_ sender: Any) {
        
        var msg = ""
        let player: String? = txtPlayer.text
        let mode: String? = txtMode.text
        let score: String? = txtScore.text
        
        if player != "" {
            if mode != "" {
                if score != "" {
                    // Create and save a score
                    Score.shared.createAndSaveScore(user: player!, mode: Int(mode!)!, score: Int(score!)!)
                    msg = "Pointage enregistré"
                } else {
                    msg = "Aucun pointage"
                }
            } else {
                msg = "Aucun mode"
            }
        } else {
            msg = "Aucun joueur"
        }
        
        lblMessage.text = msg
        
    }
    
    @IBAction func eraseAllPush(_ sender: Any) {
        // Erase all scores
        Score.shared.eraseAllScores()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ScoreTestingView did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print ("ScoreTestingView will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("ScoreTestingView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("ScoreTestingView will disappear")
        super.viewWillDisappear(animated)
        if let firstVC = presentingViewController as? ScoreVC {
            DispatchQueue.main.async {
                firstVC.viewWillAppear(animated)
            }
        }
    }
        
    override func viewDidDisappear(_ animated: Bool) {
        print ("ScoreTestingView did disappear")
    }
        
}
