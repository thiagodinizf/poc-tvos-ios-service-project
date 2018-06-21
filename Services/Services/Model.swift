//
//  Model.swift
//  Services
//
//  Created by Thiago Diniz on 21/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation
import Mapper

public class User: Mappable {
    
    let userName: String
    
    public required init(map: Mapper) throws {
        try userName = map.from("name")
    }
}
