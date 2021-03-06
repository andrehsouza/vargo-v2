//
//  FeedArticleTableViewCell.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit
import AlamofireImage

protocol FeedListItemInteraction {
    func didPressBookMark(_ row: UITableViewCell)
}

class FeedArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var bookMarkButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var feedListItemInteraction: FeedListItemInteraction?
    
    var item: FeedListItemInterface? {
        didSet {
            guard let item = item else { return }
            if let urlString = item.imageURL, let url = URL(string: urlString) {
                thumbnailImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "ic_place_holder"))
            } else {
                thumbnailImageView.image = UIImage(named: "ic_place_holder")
            }
            playerImageView.isHidden = !item.isVideo
            titleLabel.text = item.title
            descriptionLabel.text = item.description
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchBookMark(_ sender: Any) {
        bookMarkButton.isSelected = !bookMarkButton.isSelected
        feedListItemInteraction?.didPressBookMark(self)
    }
    
}
