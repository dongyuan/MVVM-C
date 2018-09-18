//
//  NewsService.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxSwift
import Moya

enum NewsServiceApi {
    case topHeadLines
}

protocol NewsServiceType {
    func getTopHeadlines() -> Single<NewsList?>
}

struct NewsService: NewsServiceType {
    private let provider: MoyaProvider<NewsServiceApi>

    init(provider: MoyaProvider<NewsServiceApi> = MoyaProvider<NewsServiceApi>()) {
        self.provider = provider
    }

    func getTopHeadlines() -> Single<NewsList?> {
        return provider.rx.request(.topHeadLines)
            .map { NewsList.from(data: $0.data) }
    }
}

extension NewsServiceApi: TargetType {
    var baseURL: URL {
        return URL(string:"https://newsapi.org/v2/")!
    }

    var path: String {
        return "/top-headlines"
    }

    var method: Moya.Method {
        return .get
    }

    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }

    var task: Task {
        return .requestParameters(parameters: ["country": "us", "apiKey": "8d0bc24797cb4ef5aa0f4eb6576a272b"], encoding: URLEncoding.default)
    }

    var sampleData: Data {
        return Data()
    }
}
