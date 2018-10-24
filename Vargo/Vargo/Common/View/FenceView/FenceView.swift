//
//  FenceView.swift
//  TheVargo
//
//  Created by Andre on 11/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

class FenceView: UIView {

    @IBOutlet private weak var loadingView: VCardView!
    @IBOutlet private weak var errorView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var btRetry: VButton!
    @IBOutlet private weak var messageLbl: UILabel!
    @IBAction private func touchRetry(_ sender: Any) {
        showFenceLoadingView()
    }
    
}

extension FenceView {
    
    func showFenceLoadingView() {
        errorView.isHidden = true
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func showErrorView(error: ErrorResponse, target: Any?, action: Selector?) {
        errorView.isHidden = false
        messageLbl.text = error.message
        loadingView.isHidden = true
        btRetry.removeTarget(nil, action: nil, for: .allEvents)
        if let target = target, let action = action, !error.hideButton {
            btRetry.setTitle(error.buttonText, for: .normal)
            btRetry.addTarget(target, action: action, for: .touchUpInside)
        } else {
            btRetry.isHidden = true
        }
        
        activityIndicator.stopAnimating()
    }
    
}
