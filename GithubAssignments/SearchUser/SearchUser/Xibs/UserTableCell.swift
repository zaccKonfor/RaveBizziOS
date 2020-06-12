//
//  UserTableCell.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/10/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell {

    static let userCellID = "userCell"
    static func userNib()-> UINib {
        return UINib(nibName: "UserTableCell", bundle: nil)
    }
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRepos: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
