//
//  GitHubUsersListCell.swift
//  Access_App_Exercise_Sean
//
//  Created by KimuraSean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import UIKit
import Kingfisher

class GitHubUsersListCell: UITableViewCell {

    private var user: GitHubUser? {
        didSet {
            
            guard let _user = user else { return }
            if let avatarUrl = _user.avatarUrl {
                avatar.kf.setImage(with: avatarUrl)
            } else {
                avatar.image = nil
            }

            nameLabel.text = _user.login
            
//            setupJobTitle(title: _user.jobTitle)
        }
    }
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabelTopDistanceConstraint: NSLayoutConstraint!
    @IBOutlet private weak var jobTitleLabelHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupModel(user: GitHubUser) {
        self.user = user
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
private extension GitHubUsersListCell {
    func setupJobTitle(title: String?) {
        guard let jobTitle = title else {
            jobTitleLabel.text = ""
            jobTitleLabelHeightConstraint.constant = 0.0
            jobTitleLabelTopDistanceConstraint.constant = 0.0
            layoutIfNeeded()
            return
        }
        jobTitleLabel.text = jobTitle
        jobTitleLabelHeightConstraint.constant = 20.0
        jobTitleLabelTopDistanceConstraint.constant = 5.0
        layoutIfNeeded()
    }
}
