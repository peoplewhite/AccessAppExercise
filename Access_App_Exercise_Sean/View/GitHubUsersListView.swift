//
//  GitHubUsersListView.swift
//  Access_App_Exercise_Sean
//
//  Created by Sean on 2024/8/14.
//  Copyright © 2024 sean. All rights reserved.
//

import SwiftUI
import PKHUD

struct GitHubUsersListView: View {
    @ObservedObject private var viewModel = GitHubUsersListViewModel()

    var body: some View {
        List {
            if viewModel.isLoading {
                EmptyView()
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else {
                ForEach(viewModel.users) { user in
                    GitHubUserListCell(user: user)
                }
            }
        }
        .listStyle(PlainListStyle())        
        .onAppear {
            callAPIToFetchGitHubAllUsers()
        }
    }

    private func callAPIToFetchGitHubAllUsers() {
        HUD.show(.progress)
        viewModel.fetchAllUsers { errorMessage in
            if let _ = errorMessage {
                HUD.flash(.error)
            } else {
                HUD.hide()
            }
        }
    }
}

#Preview {
    GitHubUsersListView()
}
