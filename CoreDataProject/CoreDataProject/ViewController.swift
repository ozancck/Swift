//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Ozan Çiçek on 15.02.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var kisiListesi: [Kisi]?

    @IBOutlet var tvKisiListesi: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        kisileriGetir()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if kisiListesi != nil {
            return kisiListesi!.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = kisiListesi![indexPath.row].ad! + " " + kisiListesi![indexPath.row].soyad!
        cell.detailTextLabel?.text = kisiListesi![indexPath.row].eposta!
        
        return cell
    }
    
    
    func kisileriGetir() {
        let fr : NSFetchRequest<Kisi> = Kisi.fetchRequest()
        
        do {
            
            kisiListesi = try (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext.fetch(fr)
            tvKisiListesi.reloadData()
            
        }catch {
            
        }
    }
}
