//
//  soundEffects.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/8/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation
import AVFoundation



class Music {
    var backgroundMusicAVA            : AVAudioPlayer!;
    var deathSoundAVA                 : AVAudioPlayer!;
    var heartSoundAVA                 : AVAudioPlayer!;
    var skullSoundAVA                 : AVAudioPlayer!;
    var biteSoundAVA                  : AVAudioPlayer!;
    
    var backgroundMusicFilename       : String = "cave-music";
    var deathSoundFilename            : String = "death";
    var heartSoundFilename            : String = "heart";
    var skullSoundFilename            : String = "skull";
    var biteSoundFilename             : String = "bite";
    
    init(){
        self.loadBackgroundMusic();
        self.loadSkullSound();
        self.loadHeartSound();
        self.loadBitSound();
        self.loadDeathSound();
    }
    
    private func loadMusic(file: String, fileType : String, loop : Bool) -> AVAudioPlayer{
        let path     = NSBundle.mainBundle().pathForResource(file, ofType: fileType);
        let soundURL = NSURL(fileURLWithPath: path!);
        var audioPlayer  : AVAudioPlayer!;
        
        do{
            try
                audioPlayer = AVAudioPlayer(contentsOfURL: soundURL);
            if(loop){
                audioPlayer.numberOfLoops = -1;
            }
            audioPlayer.prepareToPlay();
            return audioPlayer;
            
        } catch let err as NSError{
            print(err.debugDescription);
        }
        
        return audioPlayer;
    }
    
    
    private func loadBackgroundMusic(){
        backgroundMusicAVA = self.loadMusic(backgroundMusicFilename, fileType : "mp3", loop : true);
    }
    
    private func loadSkullSound(){
        skullSoundAVA = self.loadMusic(skullSoundFilename, fileType : "wav", loop : false);
    }
    
    private func loadHeartSound(){
        heartSoundAVA = self.loadMusic(heartSoundFilename, fileType : "wav", loop : false);
    }
    
    private func loadBitSound(){
        biteSoundAVA = self.loadMusic(biteSoundFilename, fileType : "wav", loop : false);
    }
    
    private func loadDeathSound(){
        deathSoundAVA = self.loadMusic(deathSoundFilename, fileType : "wav", loop : false);
    }
    
    func playBackgroundMusic(){
        backgroundMusicAVA.play();
    }
    
    func playSkullMusic(){
        skullSoundAVA.play();
    }
    
    func playHeartMusic(){
        heartSoundAVA.play();
    }
    
    func playBitSound(){
        biteSoundAVA.play();
    }
    
    func playDeathSound(){
        deathSoundAVA.play();
    }

}