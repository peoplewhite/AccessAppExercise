//
//  GitHubUsersListViewModel.swift
//  Access_App_Exercise_Sean
//
//  Created by sean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import Foundation

class GitHubUsersListViewModel: ObservableObject {
    
    @Published var users: [GitHubUser] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
        
    func fetchAllUsers(completion: @escaping (_ errorMessage: String?) -> (Void)) {
        isLoading = true
        errorMessage = nil
        API.fetchGitHubAllUsers(succeed: { (users) in
            self.users = users
            self.isLoading = false
            completion(nil)
        }) { (errorMessage) in
            self.isLoading = false
            self.errorMessage = errorMessage
            completion(errorMessage)
        }
    }
}
