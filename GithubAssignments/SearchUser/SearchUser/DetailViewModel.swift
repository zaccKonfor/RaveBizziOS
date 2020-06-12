//
//  DetailViewModel.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/11/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation



class ReposViewModel {
    var viewModel = UserViewModel()
    
   lazy var url: String? = "https://api.github.com/users//repos"
    
    var repos: [Repository] = []
  
    func getData(session: Session = URLSession.shared, completion: (() -> Void)?) {
    guard let unwrappedURL = url,
     let url = URL(string: unwrappedURL)
     else {
     completion?()
    return }
         session.getData(from: url) {[weak self]
             (data, _) in defer { completion?() }
             guard let data = data,
                 let apiResponse = try? JSONDecoder().decode([Repository].self, from: data) else {return}
             self?.repos = apiResponse
    }
        
}
    func numberOfRepos() -> Int {
        return self.repos.count
    }
    
    func reposIndex(for index: Int) -> Repository {
        return self.repos[index]
    }
}
