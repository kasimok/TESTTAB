//
//  ARDemoViewController.swift
//  testTab
//
//  Created by evilisn_jiang on 10/27/20.
//

import UIKit

class ARDemoViewController: UIViewController {

    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func exitButtonAction(_ sender: Any) {
        debugPrint("exit Ar view")
        guard let tabVC = self.tabBarController as? ICTabBarController else {return}
        tabVC.showTabBar()
        tabVC.selectedIndex = 0
    }
}
