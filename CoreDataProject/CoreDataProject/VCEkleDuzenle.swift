//
//  VCEkleDuzenle.swift
//  CoreDataProject
//
//  Created by Ozan Çiçek on 15.02.2023.
//

import UIKit
import CoreData

class VCEkleDuzenle: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfSurname: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    var kisi : Kisi?
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if kisi != nil {
            tfName.text = kisi!.ad
            tfSurname.text = kisi!.soyad
            tfEmail.text = kisi!.eposta
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnVazgecTUI(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func btnKaydetTUI(_ sender: Any) {
        
        if kisi == nil {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Kisi", in: context)
            let kisi = NSManagedObject(entity: entity!, insertInto: context)
            
            
            kisi.setValue(tfName.text, forKey: "ad")
            kisi.setValue(tfSurname.text, forKey: "soyad")
            kisi.setValue(tfEmail.text, forKey: "eposta")
        }else {
            
            kisi!.ad = tfName.text!
            kisi!.soyad = tfSurname.text!
            kisi!.eposta = tfEmail.text!
            
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true)
        
    }
}
