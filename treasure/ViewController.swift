//
//  ViewController.swift
//  treasure
//
//  Created by MEI KU on 2017/6/21.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberinput: UITextField!
    
    @IBOutlet weak var hint: UITextField!
    
    @IBOutlet weak var guessText: UILabel!
    
    @IBOutlet weak var uncase: UIImageView!
    
    @IBOutlet weak var treasureCase: UIImageView!
    
    @IBOutlet weak var gameOver: UIImageView!
    
    @IBOutlet weak var sendbtn: UIButton!
    
    @IBOutlet weak var hintbtn: UIButton!
    
    @IBOutlet weak var dialoge: UILabel!
    
    @IBOutlet weak var win: UILabel!
    
    
    let answer = 68  // 正確密碼
    var guessCount = 10  // 可猜十次
    
    
    @IBAction func sendbtn(_ sender: Any) {
        
  //check密碼
        
        let number = Int(numberinput.text!)
        
        if number != nil {
            if number == answer  {
                uncase.isHidden = true
                treasureCase.isHidden = false
                gameOver.isHidden = true
                win.isHidden = false
                
                
            }
                
                
            else {
                treasureCase.isHidden = true
                guessText.isHidden = false
                
                
            }
            
            
// You still have () Chance
            
            if guessCount > 0 {
            guessCount = guessCount - 1
            guessText.text! = "You still have \(guessCount) Chance"
                guessText.isHidden = false
                dialoge.isHidden = true
                
            }
        
            if guessCount <= 5 {
                hintbtn.isHidden = false
                guessText.isHidden = false
                
                if guessCount == 0 {
                    uncase.isHidden = true
                    treasureCase.isHidden = true
                    gameOver.isHidden = false
                    sendbtn.isEnabled = false
                    guessText.isHidden = false
                    
                }
                
            }
            
            if number == answer && guessCount <= 5 {
                hintbtn.isHidden = true
                guessText.isHidden = true
                hint.isHidden = true
                sendbtn.isEnabled = false
                
            }
            
            if number == answer && guessCount > 5 {
                guessText.isHidden = true
                sendbtn.isEnabled = false
                
            }
            
                
        }
        
    }
    
    @IBAction func hintbtn(_ sender: Any) {
        hint.isHidden = false
        
    }
    
    
 //Replay
    @IBAction func Replay(_ sender: UIButton) {
        guessCount = 10
        uncase.isHidden = false
        treasureCase.isHidden = true
        gameOver.isHidden = true
        sendbtn.isEnabled = true
        hintbtn.isHidden = true
        hint.isHidden = true
        numberinput.text! = ""
        guessText.isHidden = true
        dialoge.isHidden = false
        win.isHidden = true
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

