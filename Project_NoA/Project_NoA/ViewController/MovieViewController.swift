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
    
    //吸入ボタン
    @IBAction func breathe(_ sender: UIButton) {
        guard let url = URL(string: "") else {
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
    //採血ボタン
    @IBAction func blood(_ sender: UIButton) {
        guard let url = URL(string: "") else {
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
    //MRIボタン
    @IBAction func mri(_ sender: UIButton) {
        guard let url = URL(string: "") else {
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
