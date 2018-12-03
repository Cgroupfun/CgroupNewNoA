//
//  soundController.swift
//  Project_NoA WatchKit Extension
//
//  Created by 加藤景也 on 2018/11/21.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import WatchKit
import Foundation
import UIKit
import AVFoundation

class ouennController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
         super.awake(withContext: context)
        loopSound(name:"mesi")//後で音声追加
    }
    func loopSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            return
        }
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self

            audioPlayer.numberOfLoops = -1
            // 音声の再生
            audioPlayer.play()

        } catch {
        }
    }
    @IBAction func agree(_ sender: Any) {
                presentController(withName: "agree", context: "none")
    }
}
class toothController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"hawomigaku")//音声を変える
    }
}
class drugController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"kusuri")//音声を変える
    }
    @IBAction func agree(_ sender: Any) {
         presentController(withName: "agree", context: "none")
    }
}
class wakeController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"asadayo")//音声を変える
    }
}
class studyController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"benkyousiro")//音声を変える
    }
}
class sleepController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"yoruneruyo")//音声を変える
    }
}
class sleepNoASController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func willActivate() {
        // アプリが起動している時の動作
        super.willActivate()
        outSound(name:"oyasumi")
    }
    func outSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            return
        }
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            // 音声の再生
            audioPlayer.play()
            
        } catch {
        }
    }
}
class agreeController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
 
    @IBAction func backHome() {
        self.dismiss()
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"neru")//音声を変える
    }
}
