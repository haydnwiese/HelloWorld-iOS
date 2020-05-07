//
//  InterfaceController.swift
//  CovidTracker WatchKit Extension
//
//  Created by Haydn Wiese on 2020-05-06.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var totalAmountLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        fetchCurrentTotal()
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Private Methods
    func fetchCurrentTotal() {
        let covidService = CovidService()
        covidService.fetchCurrentTotal() { response in
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:response))
            DispatchQueue.main.async {
                self.totalAmountLabel.setText(formattedNumber)
            }
        }
    }

}
