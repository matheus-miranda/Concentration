//
//  Concentration.swift
//  Concentration
//
//  Created by Rain on 23/02/22.
//

import Foundation
import UIKit

/*
 Classes get a default empty initializer.
 */
class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            cards += [card, card] // structs get a copy when passed around
            cards.shuffle()
        }
    }
}
