//
//  Meal.swift
//  FoodTracker
//
//  Created by Haydn Wiese on 2020-04-23.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Rating must be between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
