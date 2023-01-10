//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 10.01.2023.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var logOutbut: UIButton!
    
    @IBOutlet weak var setShape: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutbut.layer.cornerRadius = 12
        setShape.layer.cornerRadius = 999
    }
    


    
    @IBAction func logOutClicked(_ sender: Any) {
    }
    
    

}
