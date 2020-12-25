//
//  NibReusable.swift
//  BDDComicsList
//
//  Created by Henrique Valcanaia on 2019-11-03.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit.UINib

protocol NibReusable: Reusable {
    static var defaultNib: UINib? { get }
}

extension NibReusable {
    static var defaultNib: UINib? {
        return UINib(nibName: Self.reuseIdentifier, bundle: nil)
    }
}
