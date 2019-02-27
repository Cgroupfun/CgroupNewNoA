//
//  ShopPopup2ViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/11/13.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation

class ShopPopup2ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    @IBAction func goHome(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    @IBAction func goOkigae(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    @IBAction func back_shop(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ShopPopup2ViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
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
