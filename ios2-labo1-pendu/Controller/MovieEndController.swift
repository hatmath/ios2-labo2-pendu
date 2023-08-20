//
//  MovieEndController.swift
//  ios2-labo1-pendu
//
//  Created by Mathieu Hatin (Étudiant) on 2023-08-19.
//

import UIKit

class MovieEndController: UIViewController {

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
