//
//  NewsList.swift
//  MVVMCTests
//
//  Created by Eric Yuan on 18/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import Foundation

@testable import MVVMC

let testNewsList = NewsList(status: "", totalResults: 20, articles: [testArticle])
let testArticle = Article(source: Source(id: "id", name: "name"), author: "author", title: "title", description: "description", url: "url", urlToImage: "urlToImage", publishedAt: Date(), content: "content")
