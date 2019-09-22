//
//  ComicsListPresenter.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListPresenter {
    weak var view: ComicsListDisplayLogic?
    let router: ComicsListRoutingLogic
    let interactor: ComicsListBusinessLogic
    fileprivate var viewModel: ComicsListViewModel?
    
    
    init(router: ComicsListRoutingLogic, interactor: ComicsListBusinessLogic) {
        self.router = router
        self.interactor = interactor
    }
}

extension ComicsListPresenter: ComicsListPresentationLogic {
    func presentComics(groupedComics: GroupedSortedComics) {
        self.viewModel = ComicsListViewModel(groupedComics: groupedComics)
        self.view?.reloadListOfComics()
    }
    
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        self.view?.displayUIActivityView(shouldPresent)
    }
    
    func presentNoInternetConnectionErrorMessage() {
        self.view?.displayErrorAlert(title: "No internet connection", message: "We failed fetching the comics because there are no internet connection")
    }
    
    func presentResponseIsInvalid() {
        self.view?.displayErrorAlert(title: "Failed fetching comics", message: "We failed fetching the comics because there was an error with the server response")
    }
    func presentCharacters(ofComic comic: Comic) {
        self.router.pushCharactersListView(ofComic: comic)
    }
}

extension ComicsListPresenter: ComicsListViewEventHandler {
    var numberOfSections: Int {
        return self.viewModel?.numberOfSections ?? 0
    }
    func numberOfComics(inSection section: Int) -> Int {
        return self.viewModel?.numberOfComics(inSection: section) ?? 0
    }
    func titleOfSection(atIndex sectionIndex: Int) -> String? {
        return self.viewModel?.titleOfSection(atIndex: sectionIndex)
    }
    func titleOfComic(atIndex index: Int, inSection sectionIndex: Int) -> String? {
        return self.viewModel?.titleOfComic(atIndex: index, inSection: sectionIndex)
    }
    func viewIsReadyToDisplayContent() {
        self.interactor.loadListOfComics()
    }
}
