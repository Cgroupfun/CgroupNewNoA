//
//  InterfaceController.swift
//  Project_NoA WatchKit Extension
//
//  Created by 加藤景也 on 2018/09/28.
//  Copyright © 2018年 加藤景也. All rights reserved.
//

import WatchKit
import Foundation
import UIKit
import AVFoundation

class InterfaceController: WKInterfaceController {
    //音声に関する変数の生成
    let engine = AVAudioEngine()
    let audioPlayerNode = AVAudioPlayerNode()
    var audioFile:AVAudioFile!
    //画像取得のための変数2つ
    var task: URLSessionDataTask?
    var isActive: Bool = false

    //NoAの画像
    @IBOutlet var NoA: WKInterfaceImage!
    
    //タッチで喋る、動く
    @IBAction func Move(_ sender: Any) {
        musicSet(name:"NoA挨拶サンプル", type:"mp3")
        // オーディオファイルの再生をスケジュールする
        self.audioPlayerNode.scheduleFile(self.audioFile!, at: nil, completionHandler: nil)
        // 再生する
        self.audioPlayerNode.play()

    animate(withDuration: 0.5) { () -> Void in
            self.NoA.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.right)
        }
        
        self.animate(withDuration: 1.0) { () -> Void in
            self.NoA.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.left)
        }
        
        self.animate(withDuration: 1.5) { () -> Void in
            self.NoA.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.center)
        }
    }
    
    @IBAction func ouenn() {
        pushController(withName: "Ouenn", context: nil)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        getImage()
    }
    
    override func willActivate() {
        // アプリが起動している時の動作
        super.willActivate()
        //画像取得に関するもの
        isActive = true
        //充電時の画面遷移
        if WKInterfaceDevice.current().batteryState == WKInterfaceDeviceBatteryState.charging{
            //NoAの寝てる画像に移動
            presentController(withName: "Oyasumi", context: nil)
        }
       
    }
    
    override func didDeactivate() {
        // アプリが起動してない状態の動作
        super.didDeactivate()
        //画像取得に関するもの
        isActive = false
        if let t = task {
            if t.state == URLSessionTask.State.running {
                t.cancel()
            }
    }
    
    }
    @IBAction func outSound() {
       getImage()
    }
    //音楽をながす関数の作成
    func musicSet (name:String, type:String){
        do {
            let path = Bundle.main.path(forResource: name, ofType: type)
            self.audioFile = try AVAudioFile.init(forReading: URL.init(fileURLWithPath: path!))
        } catch {
            fatalError("\(error)")
        }
        // AVAudioPlayerNode を AVAudioEngine に装着する
        self.engine.attach(self.audioPlayerNode)
        // Node 同士を繋ぐ
        self.engine.connect(self.audioPlayerNode, to: self.engine.mainMixerNode, format: self.audioFile!.processingFormat)

        do {
            // AVAudioEngine の処理を開始する
            try self.engine.start()
        } catch {
            fatalError("\(error)")
        }
    }
    //リモートの画像取得
    func getImage() -> Void {
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
                        self.NoA.setImage(image)
                    }
                })
            }
        }
        return task!.resume()
    }
}
