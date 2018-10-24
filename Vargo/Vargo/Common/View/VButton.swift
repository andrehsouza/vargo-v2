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
    
    @IBInspectable var layerBackgroundColor: UIColor = UIColor.clear {
        didSet {
            layer.backgroundColor = layerBackgroundColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}

