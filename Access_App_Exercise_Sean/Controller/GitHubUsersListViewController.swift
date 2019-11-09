//
//  GitHubUsersListViewController.swift
//  Access_App_Exercise_Sean
//
//  Created by sean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import UIKit

class GitHubUsersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var gitHubUserListViewModel: GitHubUsersListViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupViewModel() {
        // TODO
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO
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
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}
extension GitHubUsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension GitHubUsersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = gitHubUserListViewModel else { return 0 }
        return viewModel.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = gitHubUserListViewModel else {
            return UITableViewCell()
        }
        guard !viewModel.users.isEmpty else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId()) as? GitHubUsersListCell else {
            return UITableViewCell()
        }
        
        cell.setupModel(user: viewModel.users[indexPath.row])

        return cell
    }
}
