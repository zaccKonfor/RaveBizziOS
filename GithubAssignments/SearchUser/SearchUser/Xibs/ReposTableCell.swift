//
//  ReposTableCell.swift
//  SearchUser
//
//  Created by Zacc Konfor on 6/11/20.
//  Copyright © 2020 Zacc Konfor. All rights reserved.
//

import UIKit

class ReposTableCell: UITableViewCell {

    
    static let reposCellID = "Repository"
    static func reposNib() -> UINib {
        return UINib(nibName: "ReposTableCell", bundle: nil)
    }
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var forksCount: UILabel!
    @IBOutlet weak var starsCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
