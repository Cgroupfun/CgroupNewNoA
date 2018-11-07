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

    @IBOutlet var NoA: WKInterfaceImage!
    //画像受信側の処理
    func session( session: WCSession, didReceiveFile file: WCSessionFile ) {
        let data: NSData = NSData( contentsOf: file.fileURL )!
        let image: UIImage = UIImage( data: data as Data )!
        self.NoA.setImage( image )
    }
    @IBOutlet var ZZZ: WKInterfaceLabel!
    //タッチで喋る、動く
    @IBAction func Move(_ sender: Any) {
         self.ZZZ.setText("反応あり")
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
        self.ZZZ.setText("反応")
        pushController(withName: "Ouenn", context: nil)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // アプリが起動している時の動作
        super.willActivate()
        //充電時の画面遷移
        if WKInterfaceDevice.current().batteryState == WKInterfaceDeviceBatteryState.charging{
            self.ZZZ.setText("おやすみ")
            
            //NoAの寝てる画像に移動
            presentController(withName: "Oyasumi", context: nil)
        }
       
    }
    
    override func didDeactivate() {
        // アプリが起動してない状態の動作
        super.didDeactivate()
        
    }
}
