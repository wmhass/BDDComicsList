//
//  UIStoryboard+StoryboardIdentifiable.swift
//  BDDComicsList
//
//  Created by Henrique Valcanaia on 2019-11-03.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit.UIStoryboard
import UIKit.UIViewController

extension UIStoryboard {
    func instantiateViewController<T: UIViewController&StoryboardIdentifiable>(_: T.Type) -> T {
        guard let viewControllerInstance = self.instantiateViewController(withIdentifier: T.storyboardId) as? T else {
            fatalError("Unable to instantiate view controller of type: \(T.storyboardId)")
        }
        
        return viewControllerInstance
    }
}
