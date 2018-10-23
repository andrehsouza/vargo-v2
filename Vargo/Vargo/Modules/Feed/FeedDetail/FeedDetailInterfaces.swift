//
//  FeedDetailInterfaces.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol FeedDetailWireframeInterface: WireframeInterface { }

protocol FeedDetailViewInterface: ViewInterface {
    var feedContent: FeedItemDetailInterface? { get set }
    func reloadData()
    func showfeedContent()
    func showWaitingView(with type: FeedDetailLoadingType)
    func scrollCollectionToFirstItem()
}

protocol FeedDetailPresenterInterface: PresenterInterface {
    func didPressPlay()
    func didPressShare()
    func didPressBookmark()
    func didPressUrl()
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func didSelectItem(at indexPath: IndexPath)
    func item(at indexPath: IndexPath) -> FeedItemDetailInterface?
    func loadRelatedVideos(_ relatedVideosPage: Int?)
}

protocol FeedDetailPresenterInteractorInterface {
    func requestSuccess(_ feed: [FeedContent])
    func requestFailed(_ error: ErrorResponse)
}

protocol FeedDetailInteractorInterface: InteractorInterface {
    var presenter: FeedDetailPresenterInteractorInterface? { get set }
    func getRelatedVideos(page: Int)
}

protocol FeedItemDetailInterface: FeedListItemInterface {
    var screenTitle: String { get }
    var authorTitle: String? { get }
    var author: String? { get }
    var urlTitle: String? { get }
    var urlDescription: String? { get }
    var url: String? { get }
    var date: String? { get }
    var relatedVideosPage: Int? { get }
}
