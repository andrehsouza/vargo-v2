//
//  FeedDetailInteractor.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright (c) 2018 Andre Souza. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class FeedDetailInteractor {
    var presenter: FeedDetailPresenterInteractorInterface?
}

// MARK: - Extensions -

extension FeedDetailInteractor: FeedDetailInteractorInterface {
    
    typealias Entity = [FeedContent]
    
    func getRelatedVideos(page: Int) {
        let url = VUrl.path(for: .relatedVideos(page: page))
        let service = APIService(with: url)
        service.getData({ [weak self] (result: RequestResultType<Entity>) in
            self?._handleFeedResult(result)
        })
    }
    
}

extension FeedDetailInteractor {
    
    private func _handleFeedResult(_ result: RequestResultType<Entity>) {
        switch result {
        case .success(let relatedVideos):
            presenter?.requestSuccess(relatedVideos)
            break
        case .failure(let errorResponse):
            presenter?.requestFailed(errorResponse)
            break
        }
    }
    
}
