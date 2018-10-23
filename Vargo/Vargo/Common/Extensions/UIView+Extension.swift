//
//  UIView+Extension.swift
//  Vargo
//
//  Created by André Souza on 22/10/18.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    public func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! 'superview' was nil – call 'addSubview(view: UIView)' before calling 'bindFrameToSuperviewBounds() to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }

    class func fromNib<T: UIView>() -> T {
        let bundle = Bundle.main
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? T else {
            fatalError("Error! Could not cast custom view to \(T.identifier)")
        }
        
        return view
    }

}
