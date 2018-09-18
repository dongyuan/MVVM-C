//
//  NewsList.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import Foundation

struct NewsList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]

    static func from(data: Data) -> NewsList? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try? decoder.decode(NewsList.self, from: data)
    }
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

struct Source: Decodable {
    let id: String?
    let name: String
}
