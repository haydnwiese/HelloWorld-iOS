//
//  Meal.swift
//  FoodTracker
//
//  Created by Haydn Wiese on 2020-04-23.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("meals")
    
    // MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
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
    
    // MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(photo, forKey: PropertyKey.photo)
        coder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        guard let rating = aDecoder.decodeObject(forKey: PropertyKey.rating) as? Int else {
            return nil
        }
        
        // Must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
}
