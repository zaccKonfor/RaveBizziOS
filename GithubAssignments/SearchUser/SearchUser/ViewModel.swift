//
//  Session.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/11/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import Foundation

protocol searchDelegate {
    func delegateUserUrl()
}


class UserViewModel {

    func urlSearch(withString: String) {
        var url: String? = "https://api.github.com/users/\(withString)"

            
        let Ask = URLRequest(url: URL(string: url!)!)
               print("my name is...", Ask)
               URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
                   guard let data = data else { print(response)
                    return}
                       let apiResponse = try? JSONDecoder().decode(User.self, from: data)
                   print(apiResponse)
                self.users = apiResponse
                self.userArray.append((self.users)!)
                }
        
               }
           
    
    
    var searchItem: String? {
        didSet {
            let messege = "messageeeee"
            print(messege, searchItem)
            getData {
                DispatchQueue.main.async {
                
                }
            }
        }
    }
    
  lazy var url: String? = "https://api.github.com/users/\(searchItem)"
    var users: User?
    var userArray = [User]()
    
    func getData(session: Session = URLSession.shared, completion: (() -> Void)?) {
        guard let unwrappedURL = url,
    let url = URL(string: unwrappedURL)
    else {
    completion?()
   return }
        print(url)
        session.getData(from: url) {[weak self]
            (data,error) in defer { completion?() }
            guard error != nil else { print("error", error)
                return
            }
            guard let data = data,
                let apiResponse = try? JSONDecoder().decode(User.self, from: data) else {return}
            print(apiResponse)
            self?.users = apiResponse
            self?.userArray.append((self?.users)!)
                
            }
        }
    
    func numberOfUsers() -> Int {
           return self.userArray.count
       }
       
       func userIndex(for index: Int) -> User {
           return self.userArray[index]
    }
}
