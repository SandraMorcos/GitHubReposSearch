//
//  RepositoryTableViewCell.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/21/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import UIKit
import Kingfisher

enum Language: String {
    case python = "Python"
    case javascript = "JavaScript"
    
    var color: UIColor {
        switch self {
        case .python:
            return .systemBlue //UIColor(red: 56, green: 112, blue: 159, alpha: 1)
        case .javascript:
            return .systemYellow//UIColor(red: 238, green: 222, blue: 95, alpha: 1)
        }
    }
}

class RepositoryTableViewCell: UITableViewCell {

    static let reuseIdentifier = "RepositoryTableViewCellId"
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stargazersCountLabel: UILabel!
    @IBOutlet weak var languageIndicatorView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        languageIndicatorView.layer.cornerRadius = languageIndicatorView.frame.height/2
        userAvatarImageView.layer.cornerRadius = 4
    }
    
    func setup(with repository: RepositoryInfo) {
        userNameLabel.text = repository.owner?.login
        if let stringUrl = repository.owner?.avatarURL,
            let url = URL(string: stringUrl) {
            userAvatarImageView.kf.setImage(with: url)
        }
        repositoryNameLabel.text = repository.name
        descriptionLabel.text = repository.description
        if let stargazersCount = repository.stargazersCount {
            stargazersCountLabel.text = String(stargazersCount)
        }
        if let language = repository.language {
            languageLabel.text = language
            if let color = Language(rawValue: language)?.color {
                languageIndicatorView.backgroundColor = color
            } else {
                languageIndicatorView.backgroundColor = .white
            }
        } else {
            languageIndicatorView.backgroundColor = .clear
        }
        
    }
    
}
