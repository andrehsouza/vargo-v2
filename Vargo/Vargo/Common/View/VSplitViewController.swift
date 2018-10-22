//
//  VSplitViewController.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

class VSplitViewController: UISplitViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

// MARK: - Split view

extension VSplitViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return true
    }
    
}

// MARK: - Functions

extension VSplitViewController {
    
    private func configure() {
        preferredDisplayMode = .allVisible
        delegate = self
    }
    
}
