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

// MARK: - Image URL

extension FeedContent {
    
    var imageURL: String? {
        switch self {
        case .article(let article):
            return article.imageUrl
        case .video(let video):
            return video.thumbnail
        }
    }
    
}

// MARK: - FeedItemInterface

extension FeedContent: FeedListItemInterface {
    
    var isVideo: Bool {
        switch self {
        case .article(_):
            return false
        case .video(_):
            return true
        }
    }
    
    var title: String? {
        switch self {
        case .article(let article):
            return article.title
        case .video(let video):
            return video.title
        }
    }
    
    var description: String? {
        switch self {
        case .article(let article):
            return article.description
        case .video(_):
            return "Watch it now!"
        }
    }

}
