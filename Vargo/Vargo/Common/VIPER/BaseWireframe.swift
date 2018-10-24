//
//  BaseWireframe.swift
//  TheVargo
//
//  Created by Andre Souza on 06/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import UIKit

enum Transition {
    case root
    case push
    case present
}

protocol WireframeInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    func show(_ wireframe: BaseWireframe, with transition: Transition, animated: Bool)
    func show(_ viewController: UIViewController, with transition: Transition, animated: Bool)
    func showSimpleAlert(message: String)
}

class BaseWireframe {
    
    fileprivate unowned var _viewController: UIViewController
    
    init(viewController: UIViewController) {
        _viewController = viewController
    }
    
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension BaseWireframe: WireframeInterface {
    
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func show(_ wireframe: BaseWireframe, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController?.pushWireframe(wireframe)
        case .present:
            let navigationController = UINavigationController()
            navigationController.setRootWireframe(wireframe)
            _viewController.present(navigationController, animated: animated)
        case .root:
            navigationController?.setRootWireframe(wireframe, animated: animated)
        }
    }
    
    func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        case .present:
            _viewController.present(viewController, animated: animated)
            if let popOver = viewController.popoverPresentationController {
                popOver.sourceView = _viewController.view
                if let rightBarbuttons = _viewController.navigationItem.rightBarButtonItems {
                    popOver.barButtonItem = rightBarbuttons[rightBarbuttons.count - 1]
                }
            }
        case .root:
            navigationController?.setViewControllers([viewController], animated: animated)
        }
    }
    
    func showSimpleAlert(message: String) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: message, message: message, actions: [okAction])
    }
    
}


extension BaseWireframe {
    
    private func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
