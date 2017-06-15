//
//  ViewController.swift
//  idle001
//
//  Created by pair on 6/8/17.
//  Copyright © 2017 pair. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var superBucks = SuperBucks()
    
    @IBOutlet weak var superBucksLabel: UILabel!
    @IBOutlet weak var superBucksIconImageView: UIImageView!
    @IBOutlet weak var generateRandomCarButton: UIButton!
    @IBOutlet weak var generateOneDayOfSuperBucksButton: UIButton!
    @IBOutlet weak var enterRaceButton: UIButton!
    
    @IBAction func generateRandomCarButtonPressed(_ sender: Any) {
        
        superBucks.amount = superBucks.generateCar()
        updateSuperBucksLabel(withAmount: superBucks.amount)
        updateButtonStates(withSuperBucks: superBucks.amount)
    }
    
    @IBAction func enterRaceButtonPressed(_ sender: Any) {
        
        superBucks.amount = superBucks.enterRace()
        updateSuperBucksLabel(withAmount: superBucks.amount)
        updateButtonStates(withSuperBucks: superBucks.amount)
    }
    
    @IBAction func generateOneDayOfSuperBucksButtonPressed(_ sender: Any) {
        
        superBucks.amount = superBucks.add(1000)
        updateSuperBucksLabel(withAmount: superBucks.amount)
        updateButtonStates(withSuperBucks: superBucks.amount)

    }
    
    func updateButtonStates(withSuperBucks inputInt: Int) {
        
        // generate button
        if (superBucks.amount <= 0 || superBucks.amount - superBucks.costToGenerateCar < 0) {
            generateRandomCarButton.isEnabled = false
            generateRandomCarButton.alpha = 0.5
        }

        // enter race button
        if superBucks.amount <= 0 || superBucks.amount - superBucks.costToEnterRace < 0 {
            enterRaceButton.isEnabled = false
            enterRaceButton.alpha = 0.5
        }
        
        // enable buttons if they are affordable with current superBucks.amount
        
        if superBucks.amount >= superBucks.costToGenerateCar {
            generateRandomCarButton.isEnabled = true
            generateRandomCarButton.alpha = 1
        }
        
        if superBucks.amount >= superBucks.costToEnterRace {
            enterRaceButton.isEnabled = true
            enterRaceButton.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize superbucks
        
        
        
        updateSuperBucksLabel(withAmount: superBucks.amount)
        
        // Spend money generating a car
        
        superBucks.amount = superBucks.generateCar()
        
        print(superBucks.amount)
        
        // Spend money entering a race
        
        superBucks.amount = superBucks.enterRace()
        
        print(superBucks.amount)
    }
    
    func updateSuperBucksLabel(withAmount inputAmount: Int) {
        
        // set the label of super bucks
        superBucksLabel.text = numberFormatter.string(from: NSNumber(value: inputAmount))
    }
    
    //MARK: - Formats label to display number with commas
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
}

enum StoreActions {
    case generateCar
    case enterRace
}

struct SuperBucks {
    
    var amount = 1000
    var costToGenerateCar = 25
    var costToEnterRace = 100
    
    func subtract(_ inputInt: Int) -> Int {
        if amount - inputInt > -1 { // keeps return amount out of negative range
            return amount - inputInt
        } else {
            return 0
        }
    }
    
    func add(_ inputInt: Int) -> Int {
        return amount + inputInt
    }
    
    func generateCar() -> Int {
        if(amount > costToGenerateCar) {
            return amount - costToGenerateCar
        } else {
            return amount
        }
    }
    
    func enterRace() -> Int {
        if(amount > costToEnterRace) {
            return amount - costToEnterRace
        } else {
            return amount
        }
    }
}



// Make a store

// Store has

/*
 
 A store has superBucks. We should call them currencty. But the fact that I can write tihngs out and call them somsething and change it later makes me think I can do that.
 
 Then the store has  something thatI wan tot call teh currecny. Over time it has to do tsomething. I want to bmake sur ehta the user is getting this amount of money that is added to his account ove time. There shoudl be a call on teh times between whent eh app was reopened and when ti was las used. That is omething to keep a s the user goes throught e jrpocess of using the appl.
 
 I should look at the document that we wrote up.
 
 
 
 
 
 
 
 Racewinning
 Currency
 Store
 Build up your car
 Drivatars
 Cost something to download cars.
 Test track
 Every time you make a new car it costs SuperBucks
 Start off with 1000SB
 Every day generates
 
 Store list:
 
 Generate random car: 25SB
 Entering a race: 100SB
 Money is pooled by every one who is in the race.
 Winner gets half
 2nd 30
 3rd 20
 Have different classes of races:
 
 1000cc
 500cc
 100cc
 
 Cup.
 
 
 Persisting the cars.
 Don't make cars crash.
 
 
 
 Sell your car if it's shitty for
 Breed your car for 200SB
 
 FireBase
 Car's make money for you while you play
 
 Kentucky derby
 
 Tracing throught to see how the car is created piece by piece:
 
 CarBody is a model object
 
 Do research into the Categories of the physics.
 
 
 
 */
