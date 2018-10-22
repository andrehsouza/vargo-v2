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
            playerImageView.isHidden = !(item?.isVideo ?? false)
            titleLabel.text = item?.title
            descriptionLabel.text = item?.description
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
