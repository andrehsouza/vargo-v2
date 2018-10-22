//
//  FeedDetailPresenter.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FeedDetailPresenter {

    // MARK: - Private properties -

    private unowned var _view: FeedDetailViewInterface
    private var _interactor: FeedDetailInteractorInterface
    private var _wireframe: FeedDetailWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: FeedDetailWireframeInterface, view: FeedDetailViewInterface, interactor: FeedDetailInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -

extension FeedDetailPresenter: FeedDetailPresenterInterface {
}