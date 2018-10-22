//
//  FeedContent.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

enum FeedContent: Decodable {
    case article(Article)
    case video(Video)
}

extension FeedContent {
    
    enum CodingKeys: String, CodingKey {
        case article, video
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let article = try container.decodeIfPresent(Article.self, forKey: .article) {
            self = .article(article)
        } else {
            self = .video(try container.decode(Video.self, forKey: .video))
        }
    }
}
