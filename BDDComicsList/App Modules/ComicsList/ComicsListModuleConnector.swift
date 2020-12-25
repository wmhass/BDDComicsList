//
//  ComicsListModuleConnector.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class ComicsListModuleConnector {
    
    let shouldUseMockData: Bool
    
    init(shouldUseMockData: Bool) {
        self.shouldUseMockData = shouldUseMockData
    }
    
    func connectDependencies(comicsListViewController: ComicsListViewController) {
        // Data Layer
        let remoteData: ComicsListRemoteDataLogic = {
            guard self.shouldUseMockData else {
                return MockedComicsListData()
            }
            
            let httpDataLoader = HTTPDataLoader()
            let marvelAPIURLBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
            return ComicsListRemoteData(marvelAPIURLBuilder: marvelAPIURLBuilder,
                                        httpDataLoader: httpDataLoader)
        }()

        let dataGateway = ComicsListDataGateway(remoteData: remoteData)
        let dependencyContainer = ComicsListModuleDependenciesContainer(dataGateway: dataGateway,
                                              router: ComicsListRouter(viewController: comicsListViewController))
        ComicsListModuleDependencies().injectDependencies(comicsListViewController:  comicsListViewController, dependencyContainer: dependencyContainer)
    }
}
