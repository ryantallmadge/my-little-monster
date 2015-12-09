//
//  Game.swift
//  my-little-monster
//
//  Created by Ryan Tallmadge on 12/9/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation



class Game  : NSObject {
    
    
    let MAX_LIVES       = 3;
    let timerTime       = 3.0;
    var currentLiveLost = 0;
    var timer        : NSTimer!
    var monsterStatus   = true;
    
   override  init(){
        super.init();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "resetTimer", name: "onTargetDropped", object: nil);
        startTimer();
    }
    
    func looseLife(){
        currentLiveLost++;
    }
    
    func makeMonsterHappy(){
        monsterStatus = true;
    }
    
    func makeMonsterAngry(){
        monsterStatus = false;
    }
    
    func checkOnMoster(){
        if(!monsterStatus){
            looseLife();
        }
        let notify = NSNotification(name: "checkOnMoster", object: nil);
        NSNotificationCenter.defaultCenter().postNotification(notify);
    }
    
    func resetTimer(){
        startTimer();
    }
    
    func isGameOver() -> Bool{
        if(currentLiveLost >= MAX_LIVES){
            return true;
        }else{
            return false;
        }
    }
    
    func startTimer(){
        if timer != nil{
            timer.invalidate();
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(timerTime, target: self, selector: "checkOnMoster", userInfo: nil, repeats: true);
    }
    
    func stopTimer(){
        timer.invalidate();
    }

    
}