//
//  ScoreVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class ScoreVC: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ScoreView did load")
    }
    
    func showScore() {
        let bestScoresString = Score.shared.getBestScoresByUserAsStringFrenchAndFormat()
        lblScore.text = bestScoresString
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
