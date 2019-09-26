//
//  CustomListTableViewCell.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CustomListTableViewCell: UITableViewCell {

    @IBOutlet var customTitleLabel: UILabel!
    static let defaultReuseIdentifier = "CustomListTableViewCell"
    static var defaultNib: UINib? {
        return UINib(nibName: "CustomListTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
