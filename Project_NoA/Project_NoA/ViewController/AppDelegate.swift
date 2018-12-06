//
//  AppDelegate.swift
//  Project_NoA
//
//  Created by 加藤景也 on 2018/09/28.
//  Copyright © 2018年 加藤景也. All rights reserved.
//

import UIKit
import WatchConnectivity
import AWSCognito
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func detaSentFunc(){
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self as? WCSessionDelegate
            session.activate()
        }
    }
    
    var window: UIWindow?
    
    //コイン足りるか判定
    var NoAcoin_compare:[Int] = [
        0,0,0,0,0,0,0,0,0
    ]
    //購入アイテムキー
    var buyitem_key:[String] = [
        "number8","number9","number10","number11","number12","number13","number14","number15","number16"
    ]
    //アイテム購入判定番号
    var shop_buy_number:[Int] = [
        0,0,0,0,0,0,0,0,0
    ]
    //アイテム価格
    var shopitem_price:[Int] = [
        10,20,20,30,30,50,50,80,100
    ]
    //ノアのアイテム
    var item_image:[String] = [
        "帽子_赤",
        "帽子_青",
        "リボン_赤",
        "リボン_青",
        "かえる帽子",
        "star",
        "おばけ"
    ]
    //ショップアイテム
    var shop_item:[String] = [
        "つの",
        "めがね_あお",
        "めがね_あか",
        "はっと",
        "はな",
        "おにのお面",
        "ねこ",
        "ティアラ",
        "おうかん"
    ]
    
    var shopbuynumber:[String] = [
        "tsuno",
        "bulemegane",
        "redmegane",
        "hat",
        "flower",
        "omen",
        "cat",
        "tiara",
        "crown"
    ]
    //所持アイテム番号
    var NoA_image_number = 0
    //ショップアイテム番号
    var shop_item_number = 0
    //アイテム追加する順番
    var item_addnumber = 0
    
    var noaCoin = 0
    
    var NoA_compose:UIImage?
    
    var NoA_name:String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        sleep(2);
        
        // Amazon Cognito 認証情報プロバイダーを初期化します
        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.APNortheast1,
                                                                identityPoolId:"ap-northeast-1:f87a1475-afa6-48f6-9a8e-e86448bba568")
        
        let configuration = AWSServiceConfiguration(region:.APNortheast1, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}
