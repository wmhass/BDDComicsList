//
//  StoryboardIdentifiable.swift
//  BDDComicsList
//
//  Created by Henrique Valcanaia on 2019-11-03.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol StoryboardIdentifiable {
    static var storyboardId: String { get }
}

extension StoryboardIdentifiable {
    static var storyboardId: String {
        return String(describing: self)
    }
}
