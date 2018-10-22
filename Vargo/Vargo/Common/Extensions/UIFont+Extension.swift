//
//  UIFont+Extension.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

enum VargoFont: String {
    
    case regular = "Optima-Bold"
    
}

extension UIFont {
    
    convenience init(type: VargoFont, size: CGFloat) {
        self.init(name: type.rawValue, size: size)!
    }
    
}
