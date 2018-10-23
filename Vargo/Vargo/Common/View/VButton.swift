//
//  VButton.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

@IBDesignable
class VButton: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.white {
        didSet {
            layer.backgroundColor = fillColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            if(isEnabled) {
                alpha = 1
            } else {
                alpha = 0.4
            }
        }
    }

}

extension VButton {
    
    override func layoutSubviews() {
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
}
