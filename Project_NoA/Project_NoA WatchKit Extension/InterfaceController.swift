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


class InterfaceController: WKInterfaceController {

    
    @IBOutlet var ZZZ: WKInterfaceLabel!
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
        }
       
    }
    
    override func didDeactivate() {
        // アプリが起動してない状態の動作
        super.didDeactivate()
        
    }

}
