//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 10.01.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    @IBOutlet weak var logOutbut: UIButton!
    
    @IBOutlet weak var setShape: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutbut.layer.cornerRadius = 12
        setShape.layer.cornerRadius = setShape.layer.bounds.width / 2
        setShape.clipsToBounds = true
    }
    


    
    @IBAction func logOutClicked(_ sender: Any) {
        
        do{
            
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
            
        }catch{
            
        }
        
    }
    
    

}
