//
//  UploadVC.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 10.01.2023.
//

import UIKit

class UploadVC: UIViewController {

    @IBOutlet weak var shapeUp: UIView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var uploadImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeUp.layer.cornerRadius = shapeUp.layer.bounds.width / 2
        shapeUp.clipsToBounds = true
        uploadButton.layer.cornerRadius = uploadButton.layer.bounds.width / 2
        uploadButton.clipsToBounds = true
        
        uploadButton.layer.cornerRadius = 16
        
    }
    

    @IBAction func uploadClicked(_ sender: Any) {
    }
    
}
