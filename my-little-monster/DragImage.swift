//
//  DragImage.swift
//  my-little-monster
//
//  Created by Ryan Tallmadge on 12/8/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation;
import UIKit;

class DragImage: GameImage {
    
    var originalPosition    : CGPoint!;
    var dropTarget          : UIView?;
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center;
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.locationInView(self.superview);
            self.center  = CGPointMake(position.x,position.y);
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview);
            if(CGRectContainsPoint(target.frame, position)){
                let notify = NSNotification(name: "onTargetDropped", object: nil);
                NSNotificationCenter.defaultCenter().postNotification(notify);
            }
        }
        
        self.center = originalPosition;
    }
}