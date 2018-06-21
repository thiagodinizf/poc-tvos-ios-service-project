//
//  ViewController.swift
//  TV
//
//  Created by Thiago Diniz on 18/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import ServicesTV
import RxSwift

class ViewController: UIViewController {

    let bag = DisposeBag()
    @IBOutlet weak var userTextField: UITextField!
    
    let services = ServicesAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func show(_ sender: Any) {
        services.getUser(value: userTextField.text ?? "")
            .subscribe(onNext: { result in
                self.createAlert(userName: result)
            })
            .disposed(by: bag)
    }
    
    func createAlert(userName: String) {
        let alert = UIAlertController(title: "Name", message: userName, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
