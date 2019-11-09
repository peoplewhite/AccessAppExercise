//
//  GitHubUser.swift
//  Access_App_Exercise_Sean
//
//  Created by KimuraSean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GitHubUser {
    let avatarUrlString: String
    let login: String
    let isSiteAdmin: Bool
    
    var avatarUrl: URL? {
        return URL(string: avatarUrlString)
    }
    
    init(json: JSON) {
        self.avatarUrlString = json["avatar_url"].stringValue
        self.login = json["login"].stringValue
        self.isSiteAdmin = json["site_admin"].boolValue
    }
}
