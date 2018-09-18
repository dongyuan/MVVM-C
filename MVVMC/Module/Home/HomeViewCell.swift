//
//  HomeViewCell.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import UIKit
import Nuke

final class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    func set(article: Article) {
        if let urlToImage = article.urlToImage, let validImageUrl = URL(string: urlToImage) {
            Nuke.loadImage(with: validImageUrl, into: imageView)
        } else {
            imageView.image = nil
        }
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
}
