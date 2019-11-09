//
//  APIManager.swift
//  Access_App_Exercise_Sean
//
//  Created by KimuraSean on 2019/11/9.
//  Copyright © 2019 sean. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class API {
    static let host = "https://api.github.com"
    typealias succeed = (() -> Void)
    typealias failure = ((_ error: String) -> Void)
}
extension API {
    enum APIAction: String {
        case fetchGitHubAllUser = "/users"
        
        var url: String {
            return host + self.rawValue
        }
    }
    static var header: HTTPHeaders? {
        return [
            "Content-Type": "application/json",
        ]
    }
}
extension API {
    static func fetchGitHubAllUsers(succeed: @escaping ((_ users: [GitHubUser]) -> Void), failure: @escaping failure) {
        let url = APIAction.fetchGitHubAllUser.url
        
        Alamofire.request(url, method: .get)
            .validate(statusCode: 200..<299)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let values = data as? [Any] else { return }
                    print(values)
                    let users = values.map { GitHubUser(json: JSON($0)) }
                    succeed(users)
                    break
                case .failure(let error):
                    failure(error.localizedDescription)
                    break
                }
        }
    }
}
