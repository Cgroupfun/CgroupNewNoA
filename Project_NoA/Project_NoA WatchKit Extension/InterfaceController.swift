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
import Alamofire

class InterfaceController: WKInterfaceController {
    //時間関係の変数
    var TimeSchedule : [String:String] = ["wake":"19:11","sleep":"20:00","breakfast":"08:00","lunch":"08:00","dinner":"08:00","study":"16:26","drug_breakfast":"16:32","drug_lunch":"16:32","drug_dinner":"16:32","tooth":"19:34","tooth2":"19:34","tooth3":"19:34","tooth4":"19:34"]
    var string :String = "0 : 00"
    
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
        getImage()
        musicSet(name:"NoA挨拶サンプル", type:"mp3")

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
        presentController(withName: "Ouenn", context: "none")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        //充電監視の許可
        WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
        //初期の画像取得
        getImage()
        struct noaSetting : Codable{
            var ScannedCount : Int
            var Items : [noaItems]
            var Count : Int
        }
        struct noaItems : Codable{
            var ID :  Dictionary<String, String>?
            var breakfast :  Dictionary<String, String>?
            var dinner :  Dictionary<String, String>?
            var drug_breakfast :  Dictionary<String, String>?
            var drug_dinner :  Dictionary<String, String>?
            var drug_lunch :  Dictionary<String, String>?
            var lunch :  Dictionary<String, String>?
            var sleep :  Dictionary<String, String>?
            var tooth :  Dictionary<String, String>?
            var tooth2 :  Dictionary<String, String>?
            var tooth3 :  Dictionary<String, String>?
            var tooth4 :  Dictionary<String, String>?
            var wake :  Dictionary<String, String>?
            var study :  Dictionary<String, String>?
        }
        
        Alamofire.request("https://2kzwczqeb4.execute-api.ap-northeast-1.amazonaws.com/NoA/nomapping").responseJSON {response in
            let decoder = JSONDecoder()
            let feed = try? decoder.decode(noaSetting.self, from: response.data!)
            self.TimeSchedule["wake"] = feed?.Items[0].wake!["S"]
            self.TimeSchedule["sleep"] = feed?.Items[0].sleep!["S"]
            //self.TimeSchedule["study"] = feed?.Items[0].study!["S"]
            self.TimeSchedule["breakfast"] = feed?.Items[0].breakfast!["S"]
            self.TimeSchedule["lunch"] = feed?.Items[0].lunch!["S"]
            //self.TimeSchedule["dinner"] = feed?.Items[0].dinner!["S"]
            self.TimeSchedule["drug_breakfast"] = feed?.Items[0].drug_breakfast!["S"]
            self.TimeSchedule["drug_dinner"] = feed?.Items[0].drug_dinner!["S"]
            self.TimeSchedule["drug_lunch"] = feed?.Items[0].drug_lunch!["S"]
            self.TimeSchedule["tooth"] = feed?.Items[0].wake!["tooth"]
            self.TimeSchedule["tooth2"] = feed?.Items[0].wake!["tooth2"]
            self.TimeSchedule["tooth3"] = feed?.Items[0].wake!["tooth3"]
            self.TimeSchedule["tooth4"] = feed?.Items[0].wake!["tooth4"]
        }
    }
    
    override func willActivate() {
        // アプリが起動している時の動作
        super.willActivate()
    
        
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(InterfaceController.getTime), userInfo: nil, repeats: true)
       Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(InterfaceController.support), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(InterfaceController.zyuudenn), userInfo: nil, repeats: true)
        //画像取得に関するもの
        isActive = true
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
        // オーディオファイルの再生をスケジュールする
        self.audioPlayerNode.scheduleFile(self.audioFile!, at: nil, completionHandler: nil)
        // 再生する
        self.audioPlayerNode.play()
    }
    
    //生活支援に関する関数
    @objc func support (){
        print(TimeSchedule)
                for (Schedule,ScheduleTime)in  TimeSchedule{
                    if string == ScheduleTime{
                        if (Schedule == "tooth")||(Schedule == "tooth2")||(Schedule == "tooth3")||(Schedule == "tooth4"){
                             pushController(withName: "tooth", context: "none")
                        }else if (Schedule == "drug_breakfast")||(Schedule == "drug_lunch")||(Schedule == "drug_dinner"){
                            pushController(withName: "drug", context: "none")
                        }else if (Schedule == "breakfast")||(Schedule == "lunch")||(Schedule == "dinner"){
                            pushController(withName: "mesi", context: "none")
                        }else{
                 pushController(withName: "\(Schedule)", context: "none")
                        print("\(Schedule)")
                        }
                    }
                }
           }
    //充電状態取得の関数
    @objc func zyuudenn(){
        let batteryState: WKInterfaceDeviceBatteryState = WKInterfaceDevice.current().batteryState

        if (batteryState == WKInterfaceDeviceBatteryState.charging ||  batteryState == WKInterfaceDeviceBatteryState.full) {
            //NoAの寝てる画像に移動
            presentController(withName: "Oyasumi", context: "none")
        }
    }
    //時間取得の関数
    @objc func getTime(){
        
        let now = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH : mm"
        
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
