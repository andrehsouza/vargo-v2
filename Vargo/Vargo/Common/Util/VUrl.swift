//
//  VUrl.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

enum EndPoints {
    
    case feed(page: Int)
    case relatedVideos(page: Int)
    
    var complement: String {
        switch self {
        case .feed(let page):
            return "/feed/page/\(page)"
        case .relatedVideos(let page):
            return "/videos/related/\(page)"
        }
    }
    
}

final class VUrl {
    
    private init() { }
    
    static func path(for endPoint: EndPoints) -> String {
        return "\(Constants.server)\(endPoint.complement)"
    }
    
}
