//
//  PlayerCell.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    
    @IBOutlet weak var pictureImageView: UIImageView! {
        didSet {
            pictureImageView.image = #imageLiteral(resourceName: "avatar")
        }
    }

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = nil
        }
    }

    
    @IBOutlet weak var surnameLabel: UILabel! {
        didSet {
            surnameLabel.text = nil
        }
    }

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        pictureImageView.image = #imageLiteral(resourceName: "avatar")
        nameLabel.text =  nil
        surnameLabel.text = nil
    } 
}
