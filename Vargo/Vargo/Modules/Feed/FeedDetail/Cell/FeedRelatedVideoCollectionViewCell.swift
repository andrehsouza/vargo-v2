//
//  FeedRelatedVideoCollectionViewCell.swift
//  TheVargo
//
//  Created by Andre on 13/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedRelatedVideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionTitleLabel: UILabel!
    
    var feedListItemInteraction: FeedListItemInteraction?
    
    var item: FeedListItemInterface? {
        didSet {
            guard let item = item else { return }
            if let urlString = item.imageURL, let url = URL(string: urlString) {
                collectionImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "ic_place_holder"))
            } else {
                collectionImageView.image = UIImage(named: "ic_place_holder")
            }
            collectionTitleLabel.text = item.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
