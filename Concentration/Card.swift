//
//  Card.swift
//  Concentration
//
//  Created by Rain on 23/02/22.
//

import Foundation

/*
 Structs have no inheritance and are type valued as opposed to classes which are reference valued
 */
struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
