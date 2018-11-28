//
//  ViewController.swift
//  Project_NoA
//
//  Created by 加藤景也 on 2018/09/28.
//  Copyright © 2018年 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    //画像取得のための変数
    var task: URLSessionDataTask?
    var isActive: Bool = true
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    //お着替えボタン
    @IBAction func gookigae(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //ショップ画面
    @IBAction func goshop(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //動画ボタン
    @IBAction func gomovie(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //設定ボタン
    @IBAction func gosetting(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //戻るボタン
    @IBAction func modoru(segue: UIStoryboardSegue) {
        playSound(name: "sousaon")
    }
    //ノア本体
    @IBOutlet weak var NoA_Karada: UIImageView!
    //ノアが動く
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        //タップされた座標を調べる
        let tapPoint = sender.location(in: view)
        if tapPoint.y < 459.5 {
        
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        self.NoA_Karada.center = tapPoint
        },
                       completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ホーム画面の背景
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "iPhone6_Top.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        NoA_Image()
    }
    
    func changeNoA(){
        NoA_Karada.image = myAp.NoA_compose
        NoA_Karada.frame = CGRect(x:128, y:277, width:128, height:200)
    }
    
    func NoA_Image() -> Void {
        let url = URL(string:"https://s3-ap-northeast-1.amazonaws.com/noastorage/noa_change.png")!
        let conf = URLSessionConfiguration.default
        let session = URLSession(configuration: conf)
        task = session.dataTask(with: url) { (data, res, error) -> Void in
            if let e = error {
                print("dataTaskWithURL fail: \(e.localizedDescription)")
                return
            }
            if let d = data {
                let image = UIImage(data: d)
                DispatchQueue.main.async(execute: {
                    if self.isActive {
                        self.NoA_Karada.frame = CGRect(x:128, y:277, width:128, height:200)
                        self.NoA_Karada.image = image
                    }
                })
            }
        }
        return task!.resume()
    }
    
    struct Constants {
        static let TupacAmaruShakur = "NoA_Karada"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: AVAudioPlayerDelegate {
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
