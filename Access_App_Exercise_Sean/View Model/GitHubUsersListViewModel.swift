//
//  GitHubUsersListViewModel.swift
//  Access_App_Exercise_Sean
//
//  Created by KimuraSean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import Foundation

class GitHubUsersListViewModel {
    
    var users: [GitHubUser] = []
        
    func fetchAllUsers(completion: @escaping (_ errorMessage: String?) -> (Void)) {
        API.fetchGitHubAllUsers(succeed: { (users) in
            self.users = users
            completion(nil)
        }) { (errorMessage) in
            completion(errorMessage)
        }
    }
}
