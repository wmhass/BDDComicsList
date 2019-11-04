//
//  Reusable.swift
//  BDDComicsList
//
//  Created by Henrique Valcanaia on 2019-11-03.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
