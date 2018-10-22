//
//  Video.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    var title: String?
    var thumbnail: String?
    var videoUrl: String
    var relatedVideos: Int?
    
}
