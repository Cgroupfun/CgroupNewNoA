//
//  MovieViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/11/01.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MovieViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    //応援ボタン
    @IBAction func ouenButton(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //吸入ボタン
    @IBAction func breathe(_ sender: UIButton) {
        moviePlay(movieURL: "https://s3-ap-northeast-1.amazonaws.com/noastorage/NoA%E5%90%B8%E5%85%A5%E9%9F%B3%E3%81%82%E3%82%8Av1.mp4")
    }
    //採血ボタン
    @IBAction func blood(_ sender: UIButton) {
        moviePlay(movieURL: "")
    }
    //MRIボタン
    @IBAction func mri(_ sender: UIButton) {
        moviePlay(movieURL: "")
    }
    //動画再生
    func moviePlay(movieURL: String){
        guard let url = URL(string: movieURL) else {
            return
        }
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        // 動画再生
        present(controller, animated: true) {
            player.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MovieViewController: AVAudioPlayerDelegate {
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
