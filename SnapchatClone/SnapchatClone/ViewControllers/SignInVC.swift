//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 7.01.2023.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var shape: UIView!
    @IBOutlet weak var shape2: UIView!
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButoon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        shape.layer.cornerRadius = shape.layer.bounds.width / 2
        shape.clipsToBounds = true
        
        shape2.layer.cornerRadius = shape2.layer.bounds.width / 2
        shape2.clipsToBounds = true
        
        
        signInButton.layer.cornerRadius = 7
        signUpButoon.layer.cornerRadius = 7
        
    
        
    }
    
    
    @IBAction func signInClicked(_ sender: Any) {
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
    }
    
    
}

