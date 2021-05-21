//
//  RepositoriesResponse.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import Foundation

struct RepositoriesResponse: Codable {
    let items: [RepositoryInfo]?
    let totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
