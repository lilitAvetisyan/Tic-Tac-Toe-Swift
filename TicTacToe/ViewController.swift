//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lilit Avetisyan on 2/5/17.
//  Copyright © 2017 Lil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var finalMessege: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        activeGame = true
        playerTurn = 1
        gameState = [0,0,0,0,0,0,0,0,0] // 0 - empty, 1 - nought, 2 - cross

        var button: UIButton
        
        for i in 1...9{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        
        finalMessege.isHidden = true
        playAgainButton.isHidden = true
        
        finalMessege.center = CGPoint(x: finalMessege.center.x - 500, y: finalMessege.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        
    }
    
    var activeGame = true
    var winner = ""
    var playerTurn = 1
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 - empty, 1 - nought, 2 - cross
    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,7], [0,4,8], [2,4,6]]
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let activePosition = sender.tag-1
        
        if gameState[activePosition] == 0 && activeGame{
        if playerTurn%2 != 0{
            sender.setImage(UIImage(named: "cross.png"), for: [])
            gameState[activePosition] = 2
            winner = "Crosses"
        }
        else{
            sender.setImage(UIImage(named: "nought.png"), for: [])
            gameState[activePosition] = 1
            winner = "Noughts"
        }
            
            playerTurn+=1
            
            for combo in winningCombos{
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[0]] == gameState[combo[2]]{
                    
                    activeGame = false
                    finalMessege.text = "\(winner) has won!!)"
                    
                    finalMessege.isHidden = false
                    playAgainButton.isHidden = false
                    UIView.animate(withDuration: 1) {
                        self.finalMessege.center = CGPoint(x: self.finalMessege.center.x + 500, y: self.finalMessege.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    }
                    
               
                    
                    
                }
            }

        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalMessege.isHidden = true
        playAgainButton.isHidden = true
        
        finalMessege.center = CGPoint(x: finalMessege.center.x - 500, y: finalMessege.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

