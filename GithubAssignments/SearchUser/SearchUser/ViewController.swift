//
//  ViewController.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/10/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = UserViewModel()
    
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var searchUser: UISearchBar!
    var result: String?
    
    var arrayOfResults = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = ViewController.searchItem
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.register(UserTableCell.userNib(), forCellReuseIdentifier: UserTableCell.userCellID)
        searchUser.delegate = self
    
        self.viewModel.getData {
            DispatchQueue.main.async {
                self.userTableView.reloadData()
             }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchItem = searchText
        viewModel.urlSearch(withString: searchText)
        print("i'm here")
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfUsers()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableCell.userCellID, for: indexpath) as! UserTableCell
        
        let userInfo = viewModel.userIndex(for: indexpath.row)
        cell.userName?.text = userInfo.username
        cell.userRepos?.text = "#of Repos: \(userInfo.repos.description)"
        
        let avatar = try! UIImage(data: NSData(contentsOf: NSURL(string: userInfo.avatarImage)! as URL) as Data)
        cell.userAvatar.image = avatar
        
        return cell
   
        }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userTableView.deselectRow(at: indexPath, animated: true)
        
        let userInfo = viewModel.userIndex(for: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(identifier: DetailViewController.DetailVCID) as! DetailViewController
        
        detailVC.user = userInfo
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        }
    
    
 }


