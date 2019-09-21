//
//  ComicsListViewController.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ComicsListViewController: UIViewController {

    var interactor: ComicsListBusinessLogic?
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    fileprivate var viewModel: ComicsListViewModelLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CustomListTableViewCell.defaultNib, forCellReuseIdentifier: CustomListTableViewCell.defaultReuseIdentifier)
        
        self.displayUIActivityView(false)
        self.interactor?.loadListOfComics()
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ComicsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.numberOfSections ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfComics(inSection: section) ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel?.titleOfSection(atIndex: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomListTableViewCell.defaultReuseIdentifier, for: indexPath) as! CustomListTableViewCell
        
        cell.customTitleLabel.text = self.viewModel?.titleOfComic(atIndex: indexPath.row, inSection: indexPath.section)
        
        return cell
    }
}

extension ComicsListViewController: ComicsListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
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
    
    func displayComics(viewModel: ComicsListViewModelLogic) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}
