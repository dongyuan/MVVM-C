//
//  ViewController.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import UIKit
import RxSwift

final class HomeViewController: ViewController, BindableType {
    var viewModel: HomeViewModel!
    private let cellMinimumColumnWidth: CGFloat = 300.00
    private let cellHeight: CGFloat = 250.00

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.collectionViewLayout = ColumnFlowLayout(minimumColumnWidth: cellMinimumColumnWidth, height: cellHeight)
        }
    }

    func bindViewModel() {
        viewModel.articles.drive(collectionView.rx.items(cellIdentifier: R.reuseIdentifier.homeCollectionViewCell.identifier, cellType: HomeCollectionViewCell.self)) { _, article, cell in
            cell.set(article: article)
        }.disposed(by: disposeBag)
    }
}

