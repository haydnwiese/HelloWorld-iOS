//
//  CardModel.swift
//  MatchGame
//
//  Created by Haydn Wiese on 2020-03-15.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        for _ in 1...8 {
            let randomNumber = arc4random_uniform(13) + 1
            
            // Log the number
            print(randomNumber)
            
            // Create the first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardOne)
            
            // Create the second card object
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardTwo)
            
            // TODO: Ensure there are only unique pairs of cards
        }
        
        // Randomize the array
        
        // Return the array
        return generatedCardsArray
    }
}
