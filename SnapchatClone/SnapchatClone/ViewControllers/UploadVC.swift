//
//  UploadVC.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 10.01.2023.
//

import Firebase
import FirebaseStorage
import UIKit

class UploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var uploadButton: UIButton!

    @IBOutlet var uploadImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        uploadButton.layer.cornerRadius = uploadButton.layer.bounds.width / 2
        uploadButton.clipsToBounds = true
        uploadButton.layer.cornerRadius = 16

        uploadImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosenImage))
        uploadImageView.addGestureRecognizer(gestureRecognizer)

        uploadImageView.layer.cornerRadius = uploadImageView.layer.bounds.width / 2
        uploadImageView.clipsToBounds = true
    }

    @objc func choosenImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        uploadImageView.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }

    @IBAction func uploadClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")

        if let data = uploadImageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString

            let imageReference = mediaFolder.child("\(uuid).jpg")

            imageReference.putData(data, metadata: nil) { _, error in

                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "Error")
                } else {
                    imageReference.downloadURL { url, error in
                        let imageUrl = url?.absoluteString
                        let fireStore = Firestore.firestore()

                        let snapDictionary = ["imageUrl": imageUrl!, "snapOwner": UserSingleton.sharedUserInfo.username, "date": FieldValue.serverTimestamp()]
                            as [String: Any]
                        fireStore.collection("Snaps").addDocument(data: snapDictionary) { error in
                            if error != nil {
                                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                            } else {
                                self.tabBarController?.selectedIndex = 0
                                self.uploadImageView.image = UIImage(named: "selectimage.png")
                            }
                        }
                    }
                }
            }
        }
    }

    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
