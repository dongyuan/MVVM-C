//
//  ColumnFlowLayout.swift
//  MVVMC
//
//  Created by Eric Yuan on 18/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import UIKit

final class ColumnFlowLayout: UICollectionViewFlowLayout {
    private let minimumColumnWidth: CGFloat
    private let height: CGFloat

    init(minimumColumnWidth: CGFloat, height: CGFloat) {
        self.minimumColumnWidth = minimumColumnWidth
        self.height = height
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }

        let availableWidth = UIEdgeInsetsInsetRect(collectionView.bounds, collectionView.layoutMargins).size.width
        let width = (availableWidth / CGFloat(Int(availableWidth / minimumColumnWidth))).rounded(.down)

        itemSize = CGSize(width: width, height: height)
        sectionInset = UIEdgeInsets(top: minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        sectionInsetReference = .fromSafeArea
    }
}
