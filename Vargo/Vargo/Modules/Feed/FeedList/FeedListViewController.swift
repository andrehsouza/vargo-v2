//
//  FeedListViewController.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FeedListViewController: BaseViewController {
    
    @IBOutlet private weak var tableViewFooter: UIView!
    @IBOutlet private weak var footerLabel: UILabel!
    @IBOutlet private weak var footerActivity: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            setupTableView()
        }
    }

    // MARK: - Public properties -

    var presenter: FeedListPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupAccessibility()
    }
	
}

// MARK: - FeedListViewInterface -

extension FeedListViewController: FeedListViewInterface {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showFenceLoading(_ loading: Bool) {
        if loading {
            showFenceLoading()
        } else {
            hideFenceView()
        }
    }
    
    func showFooterLoading(_ loading: Bool) {
        tableViewFooter.isHidden = !loading
    }
    
    func showFooterUpdatedMessage(message: String) {
        footerLabel.text = message
        footerActivity.isHidden = true
    }
    
    func showError(_ error: ErrorResponse, target: Any, action: Selector) {
        showFenceError(error: error, target: target, action: action)
    }
    
}


// MARK: - Extensions -

extension FeedListViewController {

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedArticleTableViewCell.self)
    }
    
    //Tests
    private func setupAccessibility() {
        footerActivity.accessibilityIdentifier = "loadingView"
        footerLabel.accessibilityIdentifier = "footerLabel"
        tableView.accessibilityIdentifier = "feedTableView"
    }

}

// MARK: - UITableViewDelegate

extension FeedListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.willDisplayCell(at: indexPath)
    }

}


// MARK: - UITableViewDelegate

extension FeedListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FeedArticleTableViewCell
        cell.feedListItemInteraction = self
        cell.item = presenter.item(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
}

// MARK: - FeedListItemInteraction

extension FeedListViewController: FeedListItemInteraction {
    
    func didPressBookMark(_ row: UITableViewCell) {
        //if let indexPath = tableView.indexPath(for: row) {
        //TODO
       //}
    }
    
}
