//
//  CharactersListViewController.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController, CharactersListViewConnectable {
    static let DefaultStoryboardID = "CharactersListViewController"
    static let BasicCellReuseIdentifier = "BasicCell"
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    var eventHandler: CharactersListViewEventHandler?
    var dataSource: CharactersListViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        
        self.displayUIActivityView(false)
        self.eventHandler?.viewIsReadyToDisplayContent()
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfCharacters ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersListViewController.BasicCellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.dataSource?.nameOfCharacter(atIndex: indexPath.item)
        
        return cell
    }
    
    
}

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
