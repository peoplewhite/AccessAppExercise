//
//  GitHubUser.swift
//  Access_App_Exercise_Sean
//
//  Created by KimuraSean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import Foundation

struct GitHubUser {
    let avatarUrlString: String
    let name: String
    let jobTitle: String?
    
    var avatarUrl: URL? {
        return URL(string: avatarUrlString)
    }
}
