//
//  Article.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

struct Article: Decodable {
    
    var date: String?
    var title: String?
    var url: String?
    var author: String?
    var description: String?
    var imageUrl: String?
    
}
