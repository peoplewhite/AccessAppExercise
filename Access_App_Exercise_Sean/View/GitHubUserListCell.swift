//
//  GitHubUserListCell2.swift
//  Access_App_Exercise_Sean
//
//  Created by Sean on 2024/8/14.
//  Copyright © 2024 sean. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GitHubUserListCell: View {
    let user: GitHubUser
    
    var body: some View {
        HStack(spacing: 10) {
            WebImage(url: user.avatarUrl)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.login)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if user.isSiteAdmin {
                    Text("STAFF")
                        .foregroundColor(.white)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 20)
        .padding(.trailing, 10)
        .padding(.bottom, 10)
        .padding(.top, 10)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .border(.gray, width: 1)
    }
}

#Preview {
    GitHubUserListCell(user: GitHubUser.mock())
}
