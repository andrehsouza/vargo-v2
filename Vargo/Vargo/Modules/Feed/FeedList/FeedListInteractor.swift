//
//  FeedListInteractor.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class FeedListInteractor {
    var presenter: FeedListPresenterInteractorInterface?
}

// MARK: - FeedListInteractorInterface

extension FeedListInteractor: FeedListInteractorInterface {
    
    typealias Entity = Feed
    
    func getFeed(page: Int) {
        let url = VUrl.path(for: .feed(page: page))
        let service = APIService(with: url)
        service.getData({ [weak self] (result: RequestResultType<Entity>) in
            self?._handleFeedResult(result)
        })
    }
    
}

// MARK: - Extensions

extension FeedListInteractor {
    
    private func _handleFeedResult(_ result: RequestResultType<Entity>) {
        switch result {
        case .success(let feed):
            self.presenter?.requestSuccess(feed)
            break
        case .failure(let errorResponse):
            self.presenter?.requestFailed(errorResponse)
            break
        }
    }
    
}
