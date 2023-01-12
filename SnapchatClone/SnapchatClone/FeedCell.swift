//
//  FeedCell.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 12.01.2023.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var feedShape: UIView!
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var feedPP: UIImageView!
    
    @IBOutlet weak var feedUsername: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        feedPP.layer.cornerRadius = feedPP.layer.bounds.width / 2
        feedPP.clipsToBounds = true
        
        feedShape.layer.cornerRadius = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
