//
//  CustomListTableViewCellSnapshotTest.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import BDDComicsList


class CustomListTableViewCellSnapshotTest: FBSnapshotTestCase {
    
    let systemLayoutSizeToFit = CGSize(width: 320, height: 1000)
    var cell: CustomListTableViewCell!
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
        self.cell = (CustomListTableViewCell.defaultNib!.instantiate(withOwner: nil, options: nil).first as! CustomListTableViewCell)
        self.cell.backgroundColor = UIColor.white
    }
    
    func testSingleLineText() {
        self.cell.customTitleLabel.text = "Single line"
        
        self.cell.setNeedsLayout()
        self.cell.layoutIfNeeded()
        
        let size = self.cell.systemLayoutSizeFitting(systemLayoutSizeToFit)
        self.cell.frame = CGRect(x: 0, y: 0, width: systemLayoutSizeToFit.width, height: size.height)

        self.cell.setNeedsLayout()
        self.cell.layoutIfNeeded()

        self.snapshotVerifyView(self.cell, withIdentifier: "")
    }
    
    func testMultiLineText() {
        self.cell.customTitleLabel.text = "This is a very big text to have the cell with more than one line"

        self.cell.setNeedsLayout()
        self.cell.layoutIfNeeded()
        
        let size = self.cell.systemLayoutSizeFitting(systemLayoutSizeToFit)
        self.cell.frame = CGRect(x: 0, y: 0, width: systemLayoutSizeToFit.width, height: size.height)
        
        self.cell.setNeedsLayout()
        self.cell.layoutIfNeeded()
        
        self.snapshotVerifyView(self.cell, withIdentifier: "")
    }
    
}
