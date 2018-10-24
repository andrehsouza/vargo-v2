//
//  Feed.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    
    var page: Int
    var totalPages: Int
    var items: [FeedContent]
    
    init() {
        self.page = 0
        self.totalPages = 1
        self.items = []
    }
    
}
