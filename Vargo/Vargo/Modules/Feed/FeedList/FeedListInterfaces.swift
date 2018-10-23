//
//  FeedListInterfaces.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum FeedListNavigationOption {
     case detail(FeedContent)
}

protocol FeedListWireframeInterface: WireframeInterface {
    func navigate(to option: FeedListNavigationOption)
}

protocol FeedListViewInterface: ViewInterface {
    func reloadData()
    func showFenceLoading(_ loading: Bool)
    func showFooterLoading(_ loading: Bool)
    func showFooterUpdatedMessage(message: String)
    func showError(error: ErrorInterface, target: Any, action: Selector)
}

protocol FeedListPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func willDisplayCell(at indexPath: IndexPath)
    func didSelectItem(at indexPath: IndexPath)
    func item(at indexPath: IndexPath) -> FeedListItemInterface?
}

protocol FeedListInteractorInterface: InteractorInterface {
    func getFeeds(page: Int, completion: @escaping (RequestResultType<Feed>) -> Void)
}

protocol FeedListItemInterface {
    var title: String? { get }
    var description: String? { get }
    var isVideo: Bool { get }
    var imageURL: String? { get }
}
