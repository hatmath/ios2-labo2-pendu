//
//  DashboardVC.swift
//  ios2-labo2-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//

import UIKit

class DashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("DashboardView did load")

    }

    override func viewWillAppear(_ animated: Bool) {
        print ("DashboardView will appear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("DashboardView did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("DashboardView will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("DashboardView did disappear")
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
