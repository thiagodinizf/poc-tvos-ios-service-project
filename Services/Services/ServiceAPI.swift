//
//  ServiceAPI.swift
//  Services
//
//  Created by Thiago Diniz on 20/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper
import RxSwift

public class ServicesAPI {
    
    let provider = MoyaProvider<MyProvider>()
    
    public init() {
        
    }
    
    public func getUser(value: String) -> Observable<String> {
        return provider.rx
            .request(.getUser(user: value))
            .debug()
            
            .map({ (event) -> String in
                do {
                    let response = try event.filterSuccessfulStatusAndRedirectCodes()
                    let user = try response.map(to: User.self)
                    return "\(user.userName) on \(self.platform())"
                } catch {
                    return event.description
                }
            })
            .asObservable()
    }
    
    private func platform() -> String {
        #if os(iOS)
        return "iOS"
        #elseif os(tvOS)
        return "tvOS"
        #endif
    }
}
