//
//  ViewController.swift
//  tapper-game
//
//  Created by Arooj on 01/02/2016.
//  Copyright © 2016 Arooj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var time = Timer()
    var myCounter = 0
    var maxtaps = 0
    var currenttaps = 0

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var youwin: UIImageView!
    @IBOutlet weak var youloose: UIImageView!
    @IBOutlet weak var Howmanytaps: UITextField!
    @IBOutlet weak var timer:UILabel!
    @IBOutlet weak var seconds: UITextField!
    @IBOutlet weak var playbtn: UIButton!
    @IBOutlet weak var replay: UIButton!
    
    @IBOutlet weak var tapbtn: UIButton!
    @IBOutlet weak var tapslabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seconds.delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.view.endEditing(true)
        
    }
    func decrementCounter(_ mytime:Timer)
     {
        if ( myCounter == 0)
        {
            check()
           
        }
        else
        {
       
        myCounter = myCounter-1
        timer.text = String(myCounter)
        }
       
     }
    
    
     @IBAction func oncointapped (_ sender:UIButton!)
     
     {
        currenttaps+=1
        updateTapslbl()
        check()
        
     }
    
    @IBAction func replaybuttonpressed (_ sender:UIButton!)
    
    {
        youwin.isHidden = true
        youloose.isHidden = true
        restartgame()
      
       
     }
    
    @IBAction func playbuttonpressed (_ sender:UIButton!)
    
    {
          if (Howmanytaps.text != nil && Howmanytaps.text != "" && seconds.text != nil && seconds.text != "")
          
          {
           logoImg.isHidden = true
           Howmanytaps.isHidden = true
           playbtn.isHidden = true
           seconds.isHidden = true
        
           timer.isHidden = false
           tapbtn.isHidden = false
           tapslabel.isHidden = false
           myCounter = Int(seconds.text!)!
           maxtaps = Int(Howmanytaps.text!)!
           currenttaps = 0
           updateTapslbl()
           time.invalidate();
            timer.text = String(myCounter)
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decrementCounter(_:)), userInfo: nil, repeats: true)
           
          }
    }
    
    func restartgame()
    
    {
        maxtaps = 0
        myCounter = 0
        Howmanytaps.text = ""
        seconds.text = ""
        
        replay.isHidden = true
        logoImg.isHidden = false
        Howmanytaps.isHidden = false
        playbtn.isHidden = false
        seconds.isHidden = false
        
        tapbtn.isHidden = true
        tapslabel.isHidden = true
        timer.isHidden = true

     }
    
    func gamewin() ->Bool
    
    {
        if (myCounter != 0)
        {
            if (  currenttaps >= maxtaps )
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            
                return false
        }
    }
    
    func gamelost() ->Bool
   
    {
        if (myCounter == 0)
        {
            if ( currenttaps - maxtaps < 0)
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            
            return false
        }
    }
    
    func check()
    
    {
        if gamewin()
        {
            timer.isHidden = true
            tapbtn.isHidden = true
            tapslabel.isHidden = true
            youwin.isHidden = false
            replay.isHidden = false
            
        }
        if gamelost()
        {
            
            timer.isHidden = true
            tapbtn.isHidden = true
            tapslabel.isHidden = true
            youloose.isHidden = false
            replay.isHidden = false
        }
    }
  
    
    func updateTapslbl()
    
    {
       tapslabel.text="\(currenttaps) Taps"
    }
}

