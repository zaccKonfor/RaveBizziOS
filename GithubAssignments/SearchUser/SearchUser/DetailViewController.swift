//
//  DetailViewController.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/11/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var user: User?
    let viewModel = ReposViewModel()
    static let DetailVCID = "DetailVC"
    
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var userInfo: UILabel!
        @IBOutlet weak var searchRepo: UISearchBar!
    @IBOutlet weak var repoTableView: UITableView!
    @IBOutlet weak var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadOutlets()
//        navigationItem.title = "\(ViewController.searchItem!)'s Repos"
        repoTableView.dataSource = self
        repoTableView.delegate = self
        repoTableView.register(ReposTableCell.reposNib(), forCellReuseIdentifier: ReposTableCell.reposCellID)
        searchRepo.delegate = self
        
        self.viewModel.getData {
            DispatchQueue.main.async {
                self.repoTableView.reloadData()
            }
        }
        
    }
    
    func loadOutlets() {
        let image = try! UIImage(data: NSData(contentsOf: NSURL(string: user?.avatarImage ?? "")! as URL) as Data)
        avatar.image = image
        bio.text = " \(user?.username ?? "")'s Bio: \(user?.bio ?? "")"
        
        let getDate = DateFormatter()
        getDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let replaceDate = DateFormatter()
        replaceDate.dateFormat = "EEEE, MM d, yyyy, h:mm a, z"
        
        guard let oldDate = getDate.date(from: user?.dateJoined ?? "") else {return}
        let newDate = replaceDate.string(from: oldDate)
        let userData = "UserName: \(user?.username ?? "")\nEmail: \(user?.email ?? "")\nLocation:\(user?.location ?? "")\nJoin Date: \(newDate)\n\(user?.numberOfFollowers ?? 0) Followers\nFollowing \(user?.numberOfFollowing ?? 0) "
        userInfo.text = userData
    }
    
}

extension DetailViewController:  UISearchBarDelegate {

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRepos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReposTableCell.reposCellID, for: indexPath) as!
            ReposTableCell
        let repoInfo = self.viewModel.reposIndex(for: indexPath.row)
        cell.repoName?.text = repoInfo.nameOfRepo
        cell.forksCount?.text = "Forks: \(repoInfo.forks.description)"
        cell.starsCount?.text = "Stars: \(repoInfo.stars.description)"
        return cell
    }
    
    
}

extension DetailViewController: UITableViewDelegate {
    
}
