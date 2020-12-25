//
//  CharactersListViewController.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class CharactersListViewController: UIViewController, CharactersListViewConnectable, StoryboardIdentifiable {
    private static let basicCellReuseIdentifier = "BasicCell"
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - CharactersListViewConnectable
    var eventHandler: CharactersListViewEventHandler?
    var dataSource: CharactersListViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.displayUIActivityView(false)
        self.eventHandler?.viewIsReadyToDisplayContent()
    }
}

// MARK: - Private helpers
extension CharactersListViewController {
    private func setupTableView() {
        self.tableView.tableFooterView = UIView()
    }
}

// MARK: - UITableViewDataSource
extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfCharacters ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersListViewController.basicCellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.dataSource?.nameOfCharacter(atIndex: indexPath.item)
        
        return cell
    }
}

// MARK: - CharactersListDisplayLogic
extension CharactersListViewController: CharactersListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reloadListOfCharacters() {
        self.tableView.reloadData()
    }
    
    func displayViewTitle(_ viewTitle: String) {
        self.navigationItem.title = viewTitle
    }
    
    func displayUIActivityView(_ display: Bool) {
        if display {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
}
