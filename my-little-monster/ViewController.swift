//
//  ViewController.swift
//  my-little-monster
//
//  Created by Ryan Tallmadge on 12/8/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImage : MonsterImage!;
    @IBOutlet weak var foodImage    : DragImage!;
    @IBOutlet weak var heartImage   : DragImage!;
    
    @IBOutlet weak var life1: LivesImage!;
    @IBOutlet weak var life2: LivesImage!;
    @IBOutlet weak var life3: LivesImage!;


    var currentIteam : DragImage!;
    var game         : Game!;
    var music = Music();
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        foodImage.dropTarget   = monsterImage;
        heartImage.dropTarget  = monsterImage;
        heartImage.soundEffect = "Heart";
        foodImage.soundEffect  = "Bit";
        game = Game();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeGameState", name: "checkOnMoster", object: nil);
        music.playBackgroundMusic();
    }
    
    func itemDroppedOnCharacter(notif : AnyObject){
        game.makeMonsterHappy();
        if(currentIteam.soundEffect == "Heart"){
            music.playHeartMusic();
        }else if(currentIteam.soundEffect == "Bit"){
            music.playBitSound();
        }
        
        resetFood();
    }
    
    
    func resetFood(){
        heartImage.dimAlpha();
        heartImage.userInteractionEnabled = false;
        foodImage.dimAlpha();
        foodImage.userInteractionEnabled = false;
    }
    
    func changeGameState(){
        
        if(!game.monsterStatus){
            if(game.currentLiveLost == 1){
                life1.fullAlpha();
                life2.dimAlpha();
                life3.dimAlpha();
            }else if(game.currentLiveLost == 2){
                life1.fullAlpha();
                life2.fullAlpha();
                life3.dimAlpha();
            }else if(game.currentLiveLost >= 3){
                life1.fullAlpha();
                life2.fullAlpha();
                life3.fullAlpha();
            }else{
                life1.fullAlpha();
                life2.fullAlpha();
                life3.fullAlpha();
            }
            music.playSkullMusic();
        
            if(game.isGameOver()){
                gameOver();
                return;
            }
        }
        
        let rand = arc4random_uniform(2);
        resetFood();
        if(rand == 0){
            heartImage.fullAlpha();
            heartImage.userInteractionEnabled = true;
            currentIteam  = heartImage;
        }else{
            foodImage.fullAlpha();
            foodImage.userInteractionEnabled = true;
            currentIteam  = foodImage;
        }

        game.makeMonsterAngry();
        
    }
    
    func gameOver(){
        game.stopTimer();
        monsterImage.playDeathAnimation();
        resetFood();
        music.playDeathSound();
    }

}

