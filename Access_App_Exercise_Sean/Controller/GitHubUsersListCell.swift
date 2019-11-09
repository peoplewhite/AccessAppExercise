//
//  GitHubUsersListCell.swift
//  Access_App_Exercise_Sean
//
//  Created by KimuraSean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import UIKit
import Kingfisher
import DynamicColor

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
            setupAvatarCircularShaped()
        }
    }
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabelTopDistanceConstraint: NSLayoutConstraint!
    @IBOutlet private weak var jobTitleLabelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var wrapper: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wrapper.layer.borderColor = DynamicColor(hex: 0xECECEC).cgColor // ECECEC
        wrapper.layer.borderWidth = 2.0
        wrapper.layer.masksToBounds = false
//        wrapper.layer.shadowColor = DynamicColor(hex: 0xF3F3F3).cgColor
        wrapper.layer.shadowColor = UIColor.black.cgColor
        wrapper.layer.shadowOpacity = 0.5
        wrapper.layer.shadowOffset = CGSize(width: -1, height: 2)
    }
    func setupAvatarCircularShaped() {
        avatar.layer.cornerRadius = 70.0 / 2.0
        avatar.clipsToBounds = true
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
