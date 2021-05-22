//
//  SearchService.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum QueryParams: String {
    case keyword = "q"
    case type
    case pageNumber = "page"
    case users
}

enum SearchService: TargetType {
    case searchRepositories(keyword: String, pageNumber: Int)
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com/") else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        return "search/repositories"
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchRepositories(let keyword, let pageNumber):
            return .requestParameters(parameters: [QueryParams.keyword.rawValue: keyword,
                                                   QueryParams.type.rawValue: QueryParams.users.rawValue,
                                                   QueryParams.pageNumber.rawValue: pageNumber],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
