//
//  GitHubUsersListCell.swift
//  Access_App_Exercise_Sean
//
//  Created by sean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import UIKit
import Kingfisher
import DynamicColor

class GitHubUsersListCell: UITableViewCell {
    
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabelTopDistanceConstraint: NSLayoutConstraint!
    @IBOutlet private weak var jobTitleLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var wrapper: UIView!

    private var user: GitHubUser? {
        didSet {
            guard let _user = user else { return }
            if let avatarUrl = _user.avatarUrl {
                avatar.kf.setImage(with: avatarUrl)
            } else {
                avatar.image = nil
            }
            nameLabel.text = _user.login
            setupSiteAdmin(isSiteAdmin: _user.isSiteAdmin)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupWrapperUI()
        setupAvatarCircularShaped()
    }
    
    func setupModel(user: GitHubUser) {
        self.user = user
    }
}
// MARK: - > AVATAR
private extension GitHubUsersListCell {
    func setupAvatarCircularShaped() {
        avatar.layer.cornerRadius = 70.0 / 2.0
        avatar.clipsToBounds = true
    }
}
// MARK: - > WRAPPER
private extension GitHubUsersListCell {
    func setupWrapperUI() {
        wrapper.layer.borderColor = DynamicColor(hex: 0xECECEC).cgColor
        wrapper.layer.borderWidth = 2.0
        wrapper.layer.masksToBounds = false
        wrapper.layer.shadowColor = UIColor.black.cgColor
        wrapper.layer.shadowOpacity = 0.5
        wrapper.layer.shadowOffset = CGSize(width: -1, height: 2)
    }
}
// MARK: - > SITE-ADMIN
private extension GitHubUsersListCell {
    func setupSiteAdmin(isSiteAdmin: Bool) {
        guard isSiteAdmin else {
            jobTitleLabelHeightConstraint.constant = 0.0
            jobTitleLabelTopDistanceConstraint.constant = 0.0
            layoutIfNeeded()
            return
        }

        jobTitleLabelHeightConstraint.constant = 20.0
        jobTitleLabelTopDistanceConstraint.constant = 5.0
        layoutIfNeeded()
        
        makeJobTitleLabelRoundedShape()
    }
    func makeJobTitleLabelRoundedShape() {
        jobTitleLabel.layer.cornerRadius = jobTitleLabel.frame.height / 2.0
        jobTitleLabel.clipsToBounds = true
    }
}
