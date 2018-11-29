//
//  ShopPopupViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/11/02.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation

class ShopPopupViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    let userDefaults = UserDefaults.standard
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    //アイテム画像
    @IBOutlet weak var shopitem: UIImageView!
    //買いますか？orポイント足りないよ
    @IBOutlet weak var buyquestion: UILabel!
    //買うボタン画像
    @IBOutlet weak var buy_image: UIImageView!
    //戻るボタン
    @IBAction func returnButton(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    
    //かうボタン
    @IBAction func nextButton(_ sender: UIButton) {
        if(myAp.NoAcoin_compare[myAp.shop_item_number] == 1){
            //売り切れか判定する
            myAp.shop_buy_number[myAp.shop_item_number] = 1
            userDefaults.set(myAp.shop_buy_number[myAp.shop_item_number], forKey: myAp.shop_item[myAp.shop_item_number])
            userDefaults.synchronize()
            
            //コイン減少
            coin_down()
            if let controller = self.presentingViewController as? ShopViewController {
                controller.NoAcoin_show()
            }
            //売り切れ画像関数の実行
            if let controller = self.presentingViewController as? ShopViewController {
                controller.buy_after()
            }
            //インベントリに買ったアイテムを追加
            var buynumber:Int = userDefaults.object(forKey: "buyturn") as! Int
            userDefaults.set(myAp.shop_item[myAp.shop_item_number], forKey: myAp.buyitem_key[buynumber])
            userDefaults.synchronize()
            if(buynumber < 9){
                buynumber = buynumber + 1
            }
            userDefaults.set(buynumber, forKey: "buyturn")
            userDefaults.synchronize()
            
            if let controller = self.presentingViewController as? KisekaeViewController {
                controller.additem()
            }
            
            //次のポップアップの表示
            let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
            playSound(name: "ketteion")
            let popupView: ShopPopup2ViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup2") as! ShopPopup2ViewController
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            self.present(popupView, animated: false, completion: nil)
        }
    }
    
    func coin_down(){
        let imagename = myAp.shop_item[myAp.shop_item_number]
        if  (imagename == "つの") {
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 10
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "めがね_あお"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 20
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "めがね_あか"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 20
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "はっと"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 30
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "はな"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 30
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "おにのお面"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 50
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "ねこ"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 50
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "ティアラ"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 80
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }else if(imagename == "おうかん"){
            myAp.NoA_coin = userDefaults.object(forKey: "NoA_coin") as! Int - 100
            userDefaults.set(myAp.NoA_coin, forKey: "NoA_coin")
            userDefaults.synchronize()
        }
    }
    
    //買うボタン非表示・表示
    func buybutton(){
        //買うボタン表示
        if (myAp.NoAcoin_compare[myAp.shop_item_number] == 1){
            buy_image.image = UIImage(named: "kaubotan")
            buyquestion.text = "このアイテムをかう？"
            buyquestion.font = buyquestion.font.withSize(20)
            buyquestion.textColor = UIColor.white
            buyquestion.textAlignment = NSTextAlignment.center
        }else if(myAp.NoAcoin_compare[myAp.shop_item_number] == 0){
            buyquestion.text = "コインがたりないよ"
            buyquestion.font = buyquestion.font.withSize(20)
            buyquestion.textColor = UIColor.white
            buyquestion.textAlignment = NSTextAlignment.center
        }
    }
    //アイテム画像の位置
    func image_present(){
        let imagename = myAp.shop_item[myAp.shop_item_number]
        if  (imagename == "つの") {
            shopitem.frame = CGRect(x:152, y:250, width:71, height:142)
        }else if(imagename == "めがね_あお"){
            shopitem.frame = CGRect(x:113, y:304, width:149, height:58)
        }else if(imagename == "めがね_あか"){
            shopitem.frame = CGRect(x:113, y:299, width:149, height:68)
        }else if(imagename == "はっと"){
            shopitem.frame = CGRect(x:113, y:274, width:149, height:119)
        }else if(imagename == "はな"){
            shopitem.frame = CGRect(x:113, y:259, width:149, height:149)
        }else if(imagename == "おにのお面"){
            shopitem.frame = CGRect(x:111, y:221, width:153, height:226)
        }else if(imagename == "ねこ"){
            shopitem.frame = CGRect(x:120, y:252, width:134, height:162)
        }else if(imagename == "ティアラ"){
            shopitem.frame = CGRect(x:86, y:274, width:202, height:119)
        }else if(imagename == "おうかん"){
            shopitem.frame = CGRect(x:107, y:262, width:160, height:143)
        }
        let itemimage = UIImage(named: imagename)
        shopitem.image = itemimage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buybutton()
        image_present()
    }
}

extension ShopPopupViewController: AVAudioPlayerDelegate {
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
