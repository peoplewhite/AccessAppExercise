//
//  GitHubUser.swift
//  Access_App_Exercise_Sean
//
//  Created by sean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GitHubUser: Codable, Identifiable {
    let id: Int
    let avatarUrlString: String
    let login: String
    let isSiteAdmin: Bool
    
    var avatarUrl: URL? {
        return URL(string: avatarUrlString)
    }
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.avatarUrlString = json["avatar_url"].stringValue
        self.login = json["login"].stringValue
        self.isSiteAdmin = json["site_admin"].boolValue
    }
    
    // for canvas only
    static func mock() -> GitHubUser {
        return GitHubUser(
            json: JSON([
                "id": 1,
                "avatar_url": "https://example.com/avatar.jpg",
                "login": "mockUser",
                "site_admin": true
            ])
        )
    }
}
