//
//  ComicsListViewPresenterMock.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
@testable import BDDComicsList

final class ComicsListViewPresenterMock {

    var _didNotifyAComicWasSelected: (didAsk: Bool, indexPath: IndexPath?) = (false, nil)
    var _didNotifyViewIsReadyToDisplayContent: Bool = false
    let _viewModel: ComicsListViewModel
    
    
    init(comics: [Comic]) {
        let groupedSortedComics = GroupedSortedComics(comics: comics)
        self._viewModel = ComicsListViewModel(groupedComics: groupedSortedComics)
    }
}

// MARK: - ComicsListViewEventHandler
extension ComicsListViewPresenterMock: ComicsListViewEventHandler {
    func comicSelected(atIndexPath indexPath: IndexPath) {
        _didNotifyAComicWasSelected = (true, indexPath)
    }
    
    func viewIsReadyToDisplayContent() {
        _didNotifyViewIsReadyToDisplayContent = true
    }
}

// MARK: - ComicsListViewDataSource
extension ComicsListViewPresenterMock: ComicsListViewDataSource {
    var numberOfSections: Int {
        return self._viewModel.numberOfSections
    }
    func numberOfComics(inSection section: Int) -> Int {
        return self._viewModel.numberOfComics(inSection: section)
    }
    func titleOfSection(atIndex sectionIndex: Int) -> String? {
        return self._viewModel.titleOfSection(atIndex: sectionIndex)
    }
    func titleOfComic(atIndex index: Int, inSection sectionIndex: Int) -> String? {
        return self._viewModel.titleOfComic(atIndex: index, inSection: sectionIndex)
    }
}
