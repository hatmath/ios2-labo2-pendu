//
//  ScoreVC.swift
//  ios2-labo1-pendu
//
//  Created by Mathieu Hatin (Étudiant) on 2023-08-24.
//

import UIKit

class ScoreVC: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showScore()
        
    }
    
    func showScore() {
        let defaults = UserDefaults.standard
        let score = defaults.integer(forKey: "m")
        lblScore.text = String(score)
    }

}
