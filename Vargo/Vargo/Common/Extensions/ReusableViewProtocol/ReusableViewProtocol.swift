//
//  ReusableViewProtocol.swift
//  Vargo
//
//  Created by André Souza on 22/10/18.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return identifier
    }
    
}

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return identifier
    }
    
}
