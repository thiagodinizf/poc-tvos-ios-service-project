//
//  ViewController.swift
//  Mobile
//
//  Created by Thiago Diniz on 18/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import Services

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let services = ServicesAPI()
        services.printDebug()
    }
}

