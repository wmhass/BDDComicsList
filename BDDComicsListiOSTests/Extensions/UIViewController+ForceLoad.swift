//
//  UIViewController+ForceLoad.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

extension UIViewController {
    func _forceViewLoad() {
        if self.isViewLoaded {
            self.viewDidLoad()
        } else {
            self.view.isHidden = false
        }
    }
}
