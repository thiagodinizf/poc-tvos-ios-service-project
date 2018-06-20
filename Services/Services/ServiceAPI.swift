//
//  ServiceAPI.swift
//  Services
//
//  Created by Thiago Diniz on 20/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation
import Moya

public class ServicesAPI {
    
    public init() {}
    
    public func printDebug() {
        
        #if os(iOS)
            print("iOS")
        #elseif os(tvOS)
            print("tvOS")
        #endif
    }
}
