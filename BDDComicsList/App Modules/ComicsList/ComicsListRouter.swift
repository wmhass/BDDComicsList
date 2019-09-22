//
//  ComicsListRouter.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

// Router
class ComicsListRouter {
    weak var viewController: UIViewController?
}

extension ComicsListRouter: ComicsListRoutingLogic {
    func pushCharactersListView(ofComic comic: Comic) {
        let connection = CharactersListConnection { comicsListViewController, charactersListViewController in
            if let selectedIndexPath = comicsListViewController?.tableView.indexPathForSelectedRow {
                comicsListViewController?.tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
            // TODO: Do dependency injection
        }
        self.viewController?.performSegue(withIdentifier: AppSegue.characterList.rawValue, sender: connection)
    }
}
