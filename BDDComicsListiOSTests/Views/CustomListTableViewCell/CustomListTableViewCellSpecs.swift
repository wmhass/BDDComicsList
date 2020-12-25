//
//  CustomListTableViewCellSpecs.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import BDDComicsList

final class CustomListTableViewCellSpecs: QuickSpec {
    
    var customListTableViewCell: CustomListTableViewCell!
    
    override func spec() {
        
        describe("CustomListTableViewCell") {
            beforeEach {
                self.customListTableViewCell =  CustomListTableViewCell.defaultNib!.instantiate(withOwner: nil, options: nil).first as? CustomListTableViewCell
            }
            it("The custom title label should allow infinite lines") {
                expect(self.customListTableViewCell.customTitleLabel.numberOfLines).to(equal(0))
            }
        }
        
    }
    
}
