//
//  UserVC.swift
//  ios2-labo1-pendu
//
//  Created by Mathieu Hatin (Étudiant) on 2023-08-23.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var btnEnter: UIButton!
    
    @IBAction func enterTapped(_ sender: Any) {
        let tabBarController = self.storyboard?.instantiateViewController(identifier: "tabbar_id") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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


}
