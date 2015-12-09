//
//  MonsterImage.swift
//  my-little-monster
//
//  Created by Ryan Tallmadge on 12/8/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation;
import UIKit;


class MonsterImage: UIImageView {

    var idleImageArray = [UIImage]();
    var deadImageArray = [UIImage]();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder : NSCoder){
        super.init(coder : aDecoder);
        self.loadIdleImages();
        self.loadDeathImages();
        self.playIdleAnimation();
    }
    
    
    private func loadIdleImages(){
        for(var i = 1; i <= 4; i++){
            let img = UIImage(named: "idle\(i).png");
            idleImageArray.append(img!);
        }
        
    }
    
    private func loadDeathImages(){
        for(var i = 1; i <= 5; i++){
            let img = UIImage(named: "dead\(i).png");
            deadImageArray.append(img!);
        }
        
        
    }
    
    private func playAnimation(imageArray : [UIImage], playOnce : Bool){
        self.animationImages = nil;
        self.animationImages = imageArray;
        self.animationDuration = 0.8;
        if(playOnce == false){
            self.animationRepeatCount = 0;
        }else{
            self.animationRepeatCount = 1;
        }
        self.startAnimating();
    }
    
    
    func playIdleAnimation(){
        self.image = UIImage(named: "idle1.png");
        self.playAnimation(idleImageArray , playOnce : false);
    }
    
    
    func playDeathAnimation(){
        self.image = UIImage(named: "dead5.png");
        self.playAnimation(deadImageArray , playOnce : true);
    }
    
}
