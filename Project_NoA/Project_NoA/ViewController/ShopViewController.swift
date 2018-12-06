//
//  ShopViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/19.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation
import AWSDynamoDB
import AWSCore

class ShopViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    let userDefaults = UserDefaults.standard
    var myAp = UIApplication.shared.delegate as! AppDelegate
    //つの
    @IBAction func tsuno_button(_ sender: UIButton) {
        itemReaction(buynumber: 0, price: 10)
    }
    //青眼鏡
    @IBAction func bluemegane_button(_ sender: UIButton) {
        itemReaction(buynumber: 1, price: 20)
    }
    //赤眼鏡
    @IBAction func redmegane_button(_ sender: UIButton) {
        itemReaction(buynumber: 2, price: 20)
    }
    //はっと
    @IBAction func hat_button(_ sender: UIButton) {
        itemReaction(buynumber: 3, price: 30)
    }
    //おはな
    @IBAction func flower_button(_ sender: UIButton) {
        itemReaction(buynumber: 4, price: 30)
    }
    //おにのおめん
    @IBAction func omen_button(_ sender: UIButton) {
        itemReaction(buynumber: 5, price: 50)
    }
    //猫
    @IBAction func cat_button(_ sender: UIButton) {
        itemReaction(buynumber: 6, price: 50)
    }
    //ティアラ
    @IBAction func tiara(_ sender: UIButton) {
        itemReaction(buynumber: 7, price: 80)
    }
    //おうかん
    @IBAction func crown(_ sender: UIButton) {
        itemReaction(buynumber: 8, price: 100)
    }
    
    @IBOutlet var item_buyafter: [UIImageView]!
    @IBOutlet var backView: [UIView]!

    //ノアコインテキスト
    @IBOutlet weak var NoAcoin: UILabel!
    
    @IBAction func goShop(segue: UIStoryboardSegue){}
    
    var NoAState = NoAClass()
    
    func NoAcoin_data(){
        let newsItem = NoAClass()
        newsItem!.ID = "NoA"
        
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDbObjectMapper.load(
            NoAClass.self,
            hashKey: newsItem!.ID as Any,
            rangeKey: nil,
            completionHandler: {
                (objectModel: AWSDynamoDBObjectModel?, error: Error?) -> Void in
                if let error = error {
                    print("Amazon DynamoDB Read Error: \(error)")
                    return
                }
                self.NoAState = (objectModel as! NoAClass)
                self.myAp.noaCoin = self.NoAState!.Coin
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NoAcoin_data()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.NoAcoin_show()
        }
        buy_after()
    }
    //購入アイテムを押した時の関数
    func itemReaction(buynumber:Int, price:Int){
        myAp.shop_item_number = buynumber
        myAp.NoAcoin_compare[buynumber] = 0
        if(userDefaults.object(forKey: myAp.shopbuynumber[buynumber]) as! Int == 0){
            if(myAp.noaCoin >= price){
                myAp.NoAcoin_compare[buynumber] = 1
                playSound(name: "sousaon")
                popup()
            }else {
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    
    //ノアコインの表示
    func NoAcoin_show(){
        NoAcoin.text = String(self.myAp.noaCoin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //次のポップアップ表示
    func popup() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
        let popupView2: ShopPopupViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup") as! ShopPopupViewController
        popupView2.modalPresentationStyle = .overFullScreen
        popupView2.modalTransitionStyle = .crossDissolve
        self.present(popupView2, animated: false, completion: nil)
    }
    //売り切れ画像の反映
    func buyover(buyimage:UIImageView, clearView:UIView){
        buyimage.image = UIImage(named: "売り切れ")
        clearView.layer.cornerRadius = 4
        clearView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    //売り切れボタンの反映
    func buy_after(){
        for i in (0...8){
            if(userDefaults.object(forKey: myAp.shopbuynumber[i]) as! Int == 1){
                buyover(buyimage: item_buyafter[i], clearView: backView[i])
            }
        }
    }
}

extension ShopViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer.delegate = self
            audioPlayer.play()
        } catch {
        }
    }
}
