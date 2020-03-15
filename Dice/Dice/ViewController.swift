//
//  ViewController.swift
//  Dice
//
//  Created by Haydn Wiese on 2020-03-15.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }

    @IBAction func rollDice(_ sender: Any) {
        let number = (1...6).randomElement()!
        self.diceImageView.image = UIImage(named: "dice-\(number)")
    }
    
}

