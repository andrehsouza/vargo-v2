//
//  UIView+Extension.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

protocol DescribeProtocol: class { }

extension DescribeProtocol where Self: NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension NSObject: DescribeProtocol { }
