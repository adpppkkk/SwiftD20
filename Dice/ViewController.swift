//
//  ViewController.swift
//  Dice
//
//  Created by Sihong Guo on 1/21/20.
//  Copyright © 2020 Sihong Guo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var rollsound: AVAudioPlayer?
    var winsound: AVAudioPlayer?
    var losssound: AVAudioPlayer?

    @IBOutlet weak var DiceImageView: UIImageView!
    @IBOutlet weak var criticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        
        
        let path1 = Bundle.main.path(forResource: "rolldice.mp3", ofType: nil)!
        let url1 = URL(fileURLWithPath: path1)
        do{
            rollsound = try AVAudioPlayer(contentsOf: url1)
        }
        catch{
            
        }
        
        let path2 = Bundle.main.path(forResource: "failwah.mp3", ofType: nil)!
        let url2 = URL(fileURLWithPath: path2)
        do{
            losssound = try AVAudioPlayer(contentsOf: url2)
        }
        catch{
            
        }
        
        let path3 = Bundle.main.path(forResource: "zfanfare.mp3", ofType: nil)!
        let url3 = URL(fileURLWithPath: path3)
        do{
            winsound = try AVAudioPlayer(contentsOf: url3)
        }
        catch{
            
        }
    }
    func rollDice(){
        let rng = Int.random(in: 1...20)
        
        let imageName = "d\(rng)"
        //play rolling sound when click
        
        rollsound?.play()
        
        
        
        DiceImageView.image = UIImage(named: imageName)
        
        if (imageName == "d1"){
            criticalLabel.isHidden = false
            criticalLabel.text = "Critical loss!"
            //play critical loss sound
            
            losssound?.play()
        }
        else if (imageName == "d20"){
            criticalLabel.isHidden = false
            criticalLabel.text = "Critical Hit!"
            //play critical hit sound
            winsound?.play()
        }
        else{
            criticalLabel.isHidden = true
        }
        
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
    @IBAction func rollDiceFromButton(){
        rollDice()
    }

}

