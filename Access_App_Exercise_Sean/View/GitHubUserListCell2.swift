//
//  GitHubUserListCell2.swift
//  Access_App_Exercise_Sean
//
//  Created by Sean on 2024/8/14.
//  Copyright © 2024 sean. All rights reserved.
//

import SwiftUI

struct GitHubUserListCell2: View {
    let user: GitHubUser
    var body: some View {
        HStack(spacing: 20) {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text("AAA").frame(height: 20)
                Text("BBB").frame(height: 0)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
    }
}

#Preview {
    GitHubUserListCell2(user: GitHubUser.mock())
}
