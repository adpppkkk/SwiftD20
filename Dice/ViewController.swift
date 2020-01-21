//
//  ViewController.swift
//  Dice
//
//  Created by Sihong Guo on 1/21/20.
//  Copyright © 2020 Sihong Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DiceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }
    func rollDice(){
        let rng = Int.random(in: 1...20)
        
        let imageName = "d\(rng)"
        
        DiceImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func rollDiceFromButton(){
        rollDice()
    }

}

