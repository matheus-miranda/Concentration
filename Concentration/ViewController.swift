//
//  ViewController.swift
//  Concentration
//
//  Created by Rain on 22/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game.startNewGame()
        updateViewFromModel()
        flipCount = 0
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(title(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    var objectChoices = ["car", "bike", "house", "broom", "shovel", "tent"]
    
    var cardTitle = Dictionary<Int, String>() // [Int:String]()
    
    func title(for card: Card) -> String {
        if cardTitle[card.identifier] == nil, objectChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(objectChoices.count)))
            cardTitle[card.identifier] = objectChoices.remove(at: randomIndex)
        }
        
        return cardTitle[card.identifier] ?? "?"
    }
}
