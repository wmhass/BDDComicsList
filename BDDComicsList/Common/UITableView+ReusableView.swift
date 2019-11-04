//
//  UITableView+ReusableView.swift
//  BDDComicsList
//
//  Created by Henrique Valcanaia on 2019-11-03.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit.UITableView

extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) {
        if let nib = T.defaultNib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable table view cell: \(T.Type.self)")
        }

        return cell
    }
}
