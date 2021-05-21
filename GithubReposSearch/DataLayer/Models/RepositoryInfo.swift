//
//  RepositoryInfo.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import Foundation

struct RepositoryInfo: Codable {
    let owner: Owner?
    let name: String?
    let description: String?
    let stargazersCount: Int?
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case owner
        case name
        case description
        case stargazersCount = "stargazers_count"
        case language
    }
}
