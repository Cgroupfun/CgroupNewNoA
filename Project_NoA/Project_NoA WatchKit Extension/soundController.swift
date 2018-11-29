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
        loopSound(name:"NoA挨拶サンプル")
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
}
class toothController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"NoA挨拶サンプル")//音声を変える
    }
}
class drugController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"NoA挨拶サンプル")//音声を変える
    }
}
class wakeController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"NoA挨拶サンプル")//音声を変える
    }
}
class studyController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"NoA挨拶サンプル")//音声を変える
    }
}
class sleepController:WKInterfaceController,AVAudioPlayerDelegate {
    //音声に関する変数の生成
    var audioPlayer: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ouennController().loopSound(name:"se2")//音声を変える
    }
}
