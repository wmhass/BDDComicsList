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
        
        
        let connection = CharactersListModuleConnector(comic: comic, shouldUseMockData: UIApplication.shared.shouldUseMockData)
        connection.preConnection = { comicsListViewController, _ in
            if let selectedIndexPath = comicsListViewController?.tableView.indexPathForSelectedRow {
                comicsListViewController?.tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
        self.viewController?.performSegue(withIdentifier: AppStoryboard.Main.Segue.characterList.rawValue, sender: connection)
    }
}
