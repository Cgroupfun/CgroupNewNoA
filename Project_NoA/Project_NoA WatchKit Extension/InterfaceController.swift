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
    //時間関係の変数
    var TimeSchedule : [String:String] = ["wake":"16:35","sleep":"20:00","breakfast":"08:00","study":"16:26","drug":"16:32","tooth1":"19:34"]
    var string = "00:00"
    //構造体
    struct Items : Codable{
        var id : Int
        var name : String
        }
    
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
        let listUrl = "https://2kzwczqeb4.execute-api.ap-northeast-1.amazonaws.com/NoA/"
        
        guard let url = URL(string: listUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard data != nil else { return }
            print("成功")
            print()
            let json = try? JSONDecoder().decode([Items].self, from: data!)
            //print(InterfaceController().Items.name)
            
            }.resume()
        
            //print(json.wake)
            
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
        pushController(withName: "Ouenn", context: "none")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        getImage()
        
    }
    
    override func willActivate() {
        // アプリが起動している時の動作
        super.willActivate()
    
        
        Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(InterfaceController.getTime), userInfo: nil, repeats: true)
       Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(InterfaceController.support), userInfo: nil, repeats: true)

        //画像取得に関するもの
        isActive = true
        //充電時の画面遷移
        if WKInterfaceDevice.current().batteryState == WKInterfaceDeviceBatteryState.charging ||  WKInterfaceDevice.current().batteryState == WKInterfaceDeviceBatteryState.full{
            print("充電検知")
            //NoAの寝てる画像に移動
            pushController(withName: "Oyasumi", context: "none")
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
    
    //生活支援に関する関数
    @objc func support (){
                for (Schedule,ScheduleTime)in  TimeSchedule{
                    if string == ScheduleTime{
                        if (Schedule == "tooth1")||(Schedule == "tooth2")||(Schedule == "tooth3")||(Schedule == "tooth4"){
                             pushController(withName: "tooth", context: "none")
                        }else if (Schedule == "drug_breakfast")||(Schedule == "drug_lunch")||(Schedule == "drug_dinner"){
                            pushController(withName: "drug", context: "none")
                        }else{
                 pushController(withName: "\(Schedule)", context: "none")
                        print("\(Schedule)")
                        }
                    }
                }
           }
    
    //時間取得の関数
    @objc func getTime(){
        
        let now = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        string = formatter.string(from: now as Date)
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
