//
//  CustomListTableViewCell.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class CustomListTableViewCell: UITableViewCell {

    @IBOutlet var customTitleLabel: UILabel!
    static let defaultReuseIdentifier = "CustomListTableViewCell"
    static var defaultNib: UINib? {
        return UINib(nibName: "CustomListTableViewCell", bundle: nil)
    }
    
}
