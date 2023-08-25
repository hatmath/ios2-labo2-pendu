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
        print("ScoreView did load")
    }
    
    func showScore() {
        // Get best scores by user as a multiline string and print to screen
        let bestScoresString = Score.shared.getBestScoresByUserAsString()
        lblScore.text = bestScoresString
//        lblScore.text?.append(bestScoresString)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print ("ScoreView will appear")
        showScore()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("ScoreView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("ScoreView will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("ScoreView did disappear")
    }

}
