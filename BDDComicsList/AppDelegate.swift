//
//  AppDelegate.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-16.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

extension UIApplication {
    var shouldUseMockData: Bool {
        return ProcessInfo().arguments.contains(ApplicationArguments.useMockData.rawValue)
    }
}

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let connector = ComicsListModuleConnector(shouldUseMockData: UIApplication.shared.shouldUseMockData)
        if let navigationController = self.window?.rootViewController as? UINavigationController,
            let comicsListViewController = navigationController.viewControllers.first as? ComicsListViewController {
            
            connector.connectDependencies(comicsListViewController: comicsListViewController)
        }
        
        // Override point for customization after application launch.
        return true
    }
}
