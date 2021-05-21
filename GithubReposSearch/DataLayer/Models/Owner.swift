//
//  Owner.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let avatarURL: String?
    let login: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case login
    }
}
