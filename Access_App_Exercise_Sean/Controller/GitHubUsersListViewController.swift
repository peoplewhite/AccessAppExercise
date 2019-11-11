//
//  GitHubUsersListViewController.swift
//  Access_App_Exercise_Sean
//
//  Created by sean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import UIKit
import PKHUD

class GitHubUsersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let gitHubUserListViewModel: GitHubUsersListViewModel = GitHubUsersListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        callAPIToFetchGitHubAllUsers()
    }
}

// MARK: - > API
private extension GitHubUsersListViewController {
    func callAPIToFetchGitHubAllUsers() {
        HUD.show(.progress, onView: view)
        gitHubUserListViewModel.fetchAllUsers { [weak self] (errorMessage) in
            // TODO: handle error message case
            if let _ = errorMessage {
                HUD.flash(.error, onView: self?.view)
                return
            }
            HUD.hide()
            self?.tableView.reloadData()
        }
    }
}
// MARK: - > TABLEVIEW
extension GitHubUsersListViewController {
    func cellId() -> String {
        return String(describing: GitHubUsersListCell.self)
    }
    func setupTableView() {
        tableView.register(UINib(nibName: cellId(), bundle: nil), forCellReuseIdentifier: cellId())
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension GitHubUsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension GitHubUsersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubUserListViewModel.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard !gitHubUserListViewModel.users.isEmpty else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId()) as? GitHubUsersListCell else {
            return UITableViewCell()
        }
        
        cell.setupModel(user: gitHubUserListViewModel.users[indexPath.row])

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
