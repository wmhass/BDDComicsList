//
//  ComicsListPresenter.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class ComicsListPresenter {
    weak var view: ComicsListDisplayLogic?
    let router: ComicsListRoutingLogic
    let interactor: ComicsListBusinessLogic
    fileprivate var viewModel: ComicsListViewModel
    
    init(router: ComicsListRoutingLogic, interactor: ComicsListBusinessLogic) {
        self.router = router
        self.interactor = interactor
        self.viewModel = ComicsListViewModel(groupedComics: GroupedSortedComics(comics: []))
    }
}

// MARK: - ComicsListPresentationLogic
extension ComicsListPresenter: ComicsListPresentationLogic {
    func presentComics(groupedComics: GroupedSortedComics) {
        self.viewModel = ComicsListViewModel(groupedComics: groupedComics)
        self.view?.reloadListOfComics()
    }

    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        self.view?.displayUIActivityView(shouldPresent)
    }

    func presentNoInternetConnectionErrorMessage() {
        self.view?.displayErrorAlert(title: AppErrorMessages.NoInternetConnectionErrorMessage.title.rawValue,
                                     message: AppErrorMessages.NoInternetConnectionErrorMessage.message.rawValue)
    }
    
    func presentResponseIsInvalid() {
        self.view?.displayErrorAlert(title: AppErrorMessages.FailedFetchingComics.title.rawValue,
                                     message: AppErrorMessages.FailedFetchingComics.message.rawValue)
    }
    
    func presentCharacters(ofComic comic: Comic) {
        self.router.pushCharactersListView(ofComic: comic)
    }
}

// MARK: - ComicsListViewDataSource
extension ComicsListPresenter: ComicsListViewDataSource {
    var numberOfSections: Int {
        return self.viewModel.numberOfSections
    }
    
    func numberOfComics(inSection section: Int) -> Int {
        return self.viewModel.numberOfComics(inSection: section)
    }
    
    func titleOfSection(atIndex sectionIndex: Int) -> String? {
        return self.viewModel.titleOfSection(atIndex: sectionIndex)
    }
    
    func titleOfComic(atIndex index: Int, inSection sectionIndex: Int) -> String? {
        return self.viewModel.titleOfComic(atIndex: index, inSection: sectionIndex)
    }
}

// MARK: - ComicsListViewEventHandler
extension ComicsListPresenter: ComicsListViewEventHandler {
    func viewIsReadyToDisplayContent() {
        self.interactor.loadListOfComics()
    }
    
    func comicSelected(atIndexPath indexPath: IndexPath) {
        guard let selectedComic = self.viewModel.comic(atIndex: indexPath.item, inSection: indexPath.section) else {
            return
        }
        
        self.interactor.comicSelected(comic: selectedComic)
    }
}
