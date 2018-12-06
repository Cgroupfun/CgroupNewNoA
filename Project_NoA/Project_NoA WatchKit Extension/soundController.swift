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
import Alamofire
class ouennController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    var seni :Int = 0
    override func awake(withContext context: Any?) {
         super.awake(withContext: context)
        loopSound(name:"ganbre")//後で音声追加
    }
    override func willActivate() {
        super.willActivate()
        if seni == 1 {
            self.dismiss()
        }
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
            audioPlayer.stop()
            presentController(withName: "agree", context: "none")
            //ノアコインの送信？
            Alamofire.request("https://2kzwczqeb4.execute-api.ap-northeast-1.amazonaws.com/NoA/").responseJSON {response in
            }
            seni = 1
            print("ノアコインゲット")
            //audioPlayer.stop()
    }
        }
    

class toothController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"hawomigaku")
    }
}
class drugController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"kusuri")
    }
    @IBAction func agree(_ sender: Any) {
        audioPlayer.stop()
         presentController(withName: "agree", context: "none")
    }
}
class wakeController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"asadayo")
    }
}
class studyController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"benkyousiro")
    }
}
class eatController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"mesi")
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

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"homeru")//音声を変える
    }
}
