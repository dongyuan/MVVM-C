//
//  File.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxCocoa

final class HomeViewModel: ViewModel {
    let articles: Driver<[Article]>
    
    private let newsService: NewsService

    init(newsService: NewsService) {
        self.newsService = newsService
        articles = newsService.getTopHeadlines().map {$0?.articles ?? []}.asDriver(onErrorJustReturn: [])
    }
}
