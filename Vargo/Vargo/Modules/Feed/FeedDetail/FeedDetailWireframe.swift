//
//  FeedDetailWireframe.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FeedDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(type: .detail)

    // MARK: - Module setup -

    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: FeedDetailViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = FeedDetailInteractor()
        let presenter = FeedDetailPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension FeedDetailWireframe: FeedDetailWireframeInterface {

    func navigate(to option: FeedDetailNavigationOption) {
    }
}