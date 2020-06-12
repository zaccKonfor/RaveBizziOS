//
//  ViewModel.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/11/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation

protocol  Session {
    func getData(from url: URL, completion: ((Data?, Error?)-> Void)?)
}


extension URLSession: Session {
    func getData(from url: URL, completion: ((Data?, Error?)-> Void)?) {
        dataTask(with: url) { (data, _, error) in completion?(data, error)
    }.resume()
    }
    }

struct User: Codable {
    let username: String
    let avatarImage: String
    let numberOfFollowers: Int
    let numberOfFollowing: Int
    let bio: String?
    let email: String?
    let location: String?
    let repos: Int
    let reposURL: String
    let dateJoined: String
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case avatarImage = "avatar_url"
        case numberOfFollowers = "followers"
        case numberOfFollowing = "following"
        case bio
        case email
        case location
        case repos = "public_repos"
        case reposURL = "repos_url"
        case dateJoined = "created_at"
    }
}

struct Repository: Codable {
    let nameOfRepo: String
    let forks: Int
    let stars: Int
    let repoPage: String
    
    enum CodingKeys: String, CodingKey {
        case nameOfRepo = "name"
        case forks
        case stars = "stargazers_count"
        case repoPage = "html_url"
    }
}

