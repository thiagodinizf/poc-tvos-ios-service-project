//
//  Provider.swift
//  Services
//
//  Created by Thiago Diniz on 20/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Moya

enum MyProvider {
    case getUser(user: String)
}

extension MyProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .getUser(let user):
            return "/users/\(user)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getUser:
            return "teste".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser:
            return nil
        }
    }
}
