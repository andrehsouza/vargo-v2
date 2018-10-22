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

final class FeedListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
//            setupTableView()
        }
    }
    
    @IBOutlet weak var tableViewFooter: UIStackView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var footerActivity: UIActivityIndicatorView!

    // MARK: - Public properties -

    var presenter: FeedListPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension FeedListViewController: FeedListViewInterface {
    
    func reloadData() {
        
    }
    
    func showLoading(_ loading: Bool) {
        
    }
    
    func showFooterLoading(_ loading: Bool) {
        
    }
    
    func showFooterUpdatedMessage(message: String) {
        
    }
    
    func showError(error: ErrorInterface, target: Any, action: Selector) {
        
    }
    
}
