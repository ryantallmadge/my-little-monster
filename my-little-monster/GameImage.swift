//
//  GameImages.swift
//  my-little-monster
//
//  Created by Ryan Tallmadge on 12/9/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation
import UIKit


class GameImage: UIImageView {
    let DIM_ALPHA  : CGFloat = 0.2;
    let FULL_ALPHA : CGFloat = 1.0;
    
    var soundEffect : String!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder : NSCoder){
        super.init(coder : aDecoder);
        self.alpha = DIM_ALPHA;
    }
    
    func fullAlpha(){
        self.alpha = FULL_ALPHA;
    }
    
    func dimAlpha(){
        self.alpha = DIM_ALPHA;
    }
    
    
}