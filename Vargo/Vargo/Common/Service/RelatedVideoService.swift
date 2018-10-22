//
//  RelatedVideoService.swift
//  TheVargo
//
//  Created by Andre on 14/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit
import Alamofire

class RelatedVideoService: NSObject {
    
    typealias Model = [FeedContent]
    
    func get(_ page: Int, _ completion: @escaping (RequestResultType<Model>) -> Void) {
        let url = VUrl.path(for: .relatedVideos(page: page))
        let service = APIService(with: url)
        service.getData(completion)
    }
    
}

