//
//  WordVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class WordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("WordView did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        print ("WordView will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("WordView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("WordView will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("WordView did disappear")
    }
    
}
