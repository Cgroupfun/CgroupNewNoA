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
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    //のNoAの画像
    @IBOutlet var NoA: WKInterfaceImage!
    
    //画像取得のための変数2つ
    var task: URLSessionDataTask?
    var isActive: Bool = false

    //タッチで喋る、動く
    @IBAction func Move(_ sender: Any) {
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
    
    //とりあえずでボタン押したら応援
    @IBAction func ouenn() {
        pushController(withName: "Ouenn", context: nil)
    }
    
    //画像更新に関する機能
    @IBAction func getImageBtnTapped() {
        getImage()
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
        
            //NoAが寝てる状態に移動
            presentController(withName: "Suimin", context: nil)
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
    
    //リモートの画像取得する関数
    func getImage() -> Void {
        let url = URL(string:"Image_URL")!
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
