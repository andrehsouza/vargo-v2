//
//  BaseViewController.swift
//  Vargo
//
//  Created by André Souza on 22/10/18.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    private lazy var fenceView: FenceView = {
        return FenceView.fromNib()
    }()

}


// MARK: - Fence Functions

extension BaseViewController {
    
    private func verifyFenceView() {
        if(!fenceView.isDescendant(of: view)) {
            view.addSubview(fenceView)
            fenceView.bindFrameToSuperviewBounds()
            fenceView.isHidden = true
        }
    }
    
    func showFenceError(error: ErrorInterface, target: Any?, action: Selector?) {
        verifyFenceView()
        fenceView.showErrorView(error: error, target: target, action: action)
        view.bringSubviewToFront(fenceView)
        fenceView.isHidden = false
    }
    
    func showFenceLoading() {
        verifyFenceView()
        fenceView.showFenceLoadingView()
        view.bringSubviewToFront(fenceView)
        fenceView.isHidden = false
    }
    
    func hideFenceView() {
        fenceView.removeFromSuperview()
    }
    
}

