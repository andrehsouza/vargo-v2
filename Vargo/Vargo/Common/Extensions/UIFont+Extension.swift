//
//  UIFont+Extension.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

enum DMFont: String {
    
    case regular   = "SFCompactText-Regular"
    case light     = "SFCompactText-Light"
    case medium    = "SFCompactText-Medium"
    case heavy     = "SFCompactText-Heavy"
    
}

extension UIFont {
    
    convenience init(type: DMFont, size: CGFloat) {
        self.init(name: type.rawValue, size: size)!
    }
    
}
