//
//  ViewController.swift
//  HelloWorld
//
//  Created by Haydn Wiese on 2020-02-16.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMessage(sender: UIButton) {
        
        if let label = sender.titleLabel?.text {
            var description: String?
            
            let alertController = UIAlertController(title: "Meaning",
                                                    message: label,
                                                    preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: UIAlertAction.Style.default,
                                                    handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }

}

