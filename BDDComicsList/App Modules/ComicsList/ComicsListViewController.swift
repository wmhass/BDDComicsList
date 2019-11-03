//
//  ComicsListViewController.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class ComicsListViewController: UIViewController, ComicsListViewConnectable {
    static let DefaultStoryboardID = "ComicsListViewController"
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - ComicsListViewConnectable
    var eventHandler: ComicsListViewEventHandler?
    var dataSource: ComicsListViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CustomListTableViewCell.defaultNib, forCellReuseIdentifier: CustomListTableViewCell.defaultReuseIdentifier)
        self.tableView.tableFooterView = UIView()

        self.displayUIActivityView(false)
        self.eventHandler?.viewIsReadyToDisplayContent()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier,
            let appSegue = AppStoryboard.Main.Segue(rawValue: segueIdentifier) else {
            return
        }
        
        appSegue.prepare(segue: segue, sender: sender)
    }
}

// MARK: - UITableViewDelegate
extension ComicsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.eventHandler?.comicSelected(atIndexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension ComicsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.numberOfSections ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfComics(inSection: section) ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataSource?.titleOfSection(atIndex: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomListTableViewCell.defaultReuseIdentifier, for: indexPath) as! CustomListTableViewCell
        
        cell.customTitleLabel.text = self.dataSource?.titleOfComic(atIndex: indexPath.row, inSection: indexPath.section)
        
        return cell
    }
}

// MARK: - ComicsListDisplayLogic
extension ComicsListViewController: ComicsListDisplayLogic {
    func reloadListOfComics() {
        self.tableView.reloadData()
    }
    
    func displayErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
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
