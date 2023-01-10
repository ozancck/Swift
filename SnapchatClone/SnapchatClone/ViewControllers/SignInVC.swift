//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 7.01.2023.
//

import Firebase
import UIKit

class SignInVC: UIViewController {
    @IBOutlet var shape: UIView!
    @IBOutlet var shape2: UIView!

    @IBOutlet var emailText: UITextField!
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!

    @IBOutlet var signInButton: UIButton!

    @IBOutlet var signUpButoon: UIButton!

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
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "Error" )
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else {
            makeAlert(title: "Error", message: "fill the boxes")
        }
        
        
    }

    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && usernameText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { _, error in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "Error")
                } else {
                    let firestore = Firestore.firestore()

                    let userDictionary = ["email": self.emailText.text!, "username": self.usernameText.text!] as [String: Any]

                    firestore.collection("userInfo").addDocument(data: userDictionary) { error in
                        if error != nil {
                            self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
                        }
                    }

                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }

        } else {
            makeAlert(title: "error", message: "Username/ password/ email")
        }
    }

    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
