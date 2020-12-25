//
//  ComicsListRouter.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class ComicsListRouter {
    fileprivate weak var viewController: ComicsListViewController?
    init(viewController: ComicsListViewController) {
        self.viewController = viewController
    }
}

// MARK: - ComicsListRoutingLogic
extension ComicsListRouter: ComicsListRoutingLogic {
    func pushCharactersListView(ofComic comic: Comic) {
        let connection = CharactersListModuleConnector(comic: comic,
                                                       shouldUseMockData: UIApplication.shared.shouldUseMockData)
        connection.preConnection = {
            if let selectedIndexPath = self.viewController?.tableView.indexPathForSelectedRow {
                self.viewController?.tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
        self.viewController?.performSegue(withIdentifier: AppStoryboard.Main.Segue.characterList.rawValue,
                                          sender: connection)
    }
}
