//
//  FeedVC.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 10.01.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let firestoreDatabase = Firestore.firestore()
    
    var snapArray = [Snap]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        getUserInfo()
        
        getSnapsFromFirebase()
        
        
    }
    
    
    
    func getSnapsFromFirebase(){
        firestoreDatabase.collection("Snaps").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
            }else {
                
                if snapshot?.isEmpty == false && snapshot != nil {
                    
                    self.snapArray.removeAll(keepingCapacity: false)
                    
                    for documnet in snapshot!.documents {
                        
                        let documentId = documnet.documentID
                        
                        if let username = documnet.get("SnapOwner") as? String {
                            if let imageUrls = documnet.get("imageUrls") as? [String]{
                                if let date = documnet.get("date") as? Timestamp {
                                    
                                    if let pp = documnet.get("PP") as? String {
                                        
                                        if let difference = Calendar.current.dateComponents([.hour], from: date.dateValue(), to: Date()).hour {
                                            
                                            if difference >= 24 {
                                                self.firestoreDatabase.collection("Snaps").document(documentId).delete()
                                            }else {
                                                let snap =  Snap(username: username, imageUrls: imageUrls, date: date.dateValue(), PP: pp)
                                                self.snapArray.append(snap)
                                            }
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    self.tableView.reloadData()
                   
                }
                
                
                
            }
            
        }
        
        
        
    }
    

    func getUserInfo(){
        firestoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { snapshot, error in
            
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                
            }else {
                if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents {
                        if let username = document.get("username") as? String {
                            if let pp = document.get("PP") as? String {
                                UserSingleton.sharedUserInfo.pp = pp
                                UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                                UserSingleton.sharedUserInfo.username = username
                                
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.feedUsername.text = snapArray[indexPath.row].username
        cell.feedImageView.sd_setImage(with: URL(string: snapArray[indexPath.row].imageUrls[0]))
        cell.feedPP.sd_setImage(with: URL(string: snapArray[indexPath.row].PP))
        
        return cell
    }
    
    
}
