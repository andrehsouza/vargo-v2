//
//  VImageView.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import UIKit

@IBDesignable
class VImageView: UIImageView {
    
    @IBInspectable var isRenderingMode: Bool = false {
        didSet{
            if let image = self.image {
                let rederingMode: UIImage.RenderingMode = isRenderingMode ? .alwaysTemplate : .alwaysOriginal
                self.image = image.withRenderingMode(rederingMode)
            }
        }
    }

}
