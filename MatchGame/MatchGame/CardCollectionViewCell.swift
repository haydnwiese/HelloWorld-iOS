//
//  CardCollectionViewCell.swift
//  MatchGame
//
//  Created by Haydn Wiese on 2020-03-15.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card: Card) {
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
    }
    
    func flip() {
        
    }
    
    func flipBack() {
        
    }
}
