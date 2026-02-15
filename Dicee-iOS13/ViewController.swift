//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
// Edited by Christian Lowery on 2/11/2026
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Background Set
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // Main Two Dices: Rolls 1-6
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // Mini Seven Dices: Rolls 1-6
    @IBOutlet weak var subDiceImageView1: UIImageView!
    @IBOutlet weak var subDiceImageView2: UIImageView!
    @IBOutlet weak var subDiceImageView3: UIImageView!
    @IBOutlet weak var subDiceImageView4: UIImageView!
    @IBOutlet weak var subDiceImageView5: UIImageView!
    @IBOutlet weak var subDiceImageView6: UIImageView!
    @IBOutlet weak var subDiceImageView7: UIImageView!
    
    //Dice Sums
    @IBOutlet weak var twoDiceSum: UILabel!
    @IBOutlet weak var miniDiceSum: UILabel!
    @IBOutlet weak var specialDiceSum: UILabel!
    
    // Special Two Dices: Rolls 1-7
    @IBOutlet weak var specialDiceImageView1: UIImageView!
    @IBOutlet weak var specialDiceImageView2: UIImageView!
    
    // Sound Player
    var audioPlayer: AVAudioPlayer?
    func playSound() {
        guard let url = Bundle.main.url(forResource: "dragon_ball_z_tele.mp3", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error - oops! No sound made!")
        }
    }
    
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //-----------------------------------------------------------------------------------------
        // TYPE #imageLiteral(
        // to use images as values!
        
        let backGroundImages = [#imageLiteral(resourceName: "Background 1.5"), #imageLiteral(resourceName: "Background2"), #imageLiteral(resourceName: "Background3"), #imageLiteral(resourceName: "Background4"), #imageLiteral(resourceName: "Background5"), #imageLiteral(resourceName: "Background6")]
        let diceArray = [#imageLiteral(resourceName: "Dice1"),#imageLiteral(resourceName: "Dice2"),#imageLiteral(resourceName: "Dice3"),#imageLiteral(resourceName: "Dice4"),#imageLiteral(resourceName: "Dice5"),#imageLiteral(resourceName: "Dice6"),#imageLiteral(resourceName: "Dice7")]
        playSound()
        
        //-----------------------------------------------------------------------------------------
        // Reset Counters for Sums
        
        twoDiceSum.text = "0"
        miniDiceSum.text = "0"
        specialDiceSum.text = "0"
        
        var randomizeTwoDice = [0,0]
        var sumOfTwoDice = 0
        var randomizeMiniDice = [0,0,0,0,0,0,0]
        var sumOfMiniDice = 0
        var randomizeSpecialDice = [0,0]
        var sumOfSpecialDice = 0
        
        for roll in 0..<randomizeTwoDice.count
        {
            randomizeTwoDice[roll] = Int.random(in: 0...5)
            sumOfTwoDice += randomizeTwoDice[roll] + 1
        }
        
        for roll in 0..<randomizeMiniDice.count
        {
            randomizeMiniDice[roll] = Int.random(in: 0...5)
            sumOfMiniDice += randomizeMiniDice[roll] + 1
        }
        
        for roll in 0..<randomizeSpecialDice.count
        {
            randomizeSpecialDice[roll] = Int.random(in: 0...6)
            sumOfSpecialDice += randomizeSpecialDice[roll] + 1
        }
        
        //-----------------------------------------------------------------------------------------
        // Special Variable for Dice #1 with Background #
        
        let randomizeBackground = randomizeTwoDice[0]
        
        //-----------------------------------------------------------------------------------------
        // Set Background from Special Variable randomFirstDiceAndBackground
        backgroundImageView.image = backGroundImages[randomizeBackground]
        
        //-----------------------------------------------------------------------------------------
        // Main Two Dices - Dice # 1 is special, because it sets up the background based on what is rolled here!
        diceImageView1.image = diceArray[randomizeTwoDice[0]]
        diceImageView2.image = diceArray[randomizeTwoDice[1]]
        
        // Grab The Sum Of The First Two Dices Using Hash Values
        twoDiceSum.text = "\(sumOfTwoDice)"
        
        //-----------------------------------------------------------------------------------------
        // Mini Seven Dices
        subDiceImageView1.image = diceArray[randomizeMiniDice[0]]
        subDiceImageView2.image = diceArray[randomizeMiniDice[1]]
        subDiceImageView3.image = diceArray[randomizeMiniDice[2]]
        subDiceImageView4.image = diceArray[randomizeMiniDice[3]]
        subDiceImageView5.image = diceArray[randomizeMiniDice[4]]
        subDiceImageView6.image = diceArray[randomizeMiniDice[5]]
        subDiceImageView7.image = diceArray[randomizeMiniDice[6]]
        
        // Grab The Sum Of The Seven Dices Using Hash Values
        miniDiceSum.text = "\(sumOfMiniDice)"
        
        //-----------------------------------------------------------------------------------------
        // Special Two Dices
        specialDiceImageView1.image = diceArray[randomizeSpecialDice[0]]
        specialDiceImageView2.image = diceArray[randomizeSpecialDice[1]]
        
        // Grab The Sum Of The Special Dices Using Hash Values
        specialDiceSum.text = "\(sumOfSpecialDice)"
    }
}
