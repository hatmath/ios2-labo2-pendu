//
//  MovieEndVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class MovieEndVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("MovieEndView did load")

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
