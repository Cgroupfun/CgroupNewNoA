//
//  ShopViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/19.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation

class ShopViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    let userDefaults = UserDefaults.standard
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    //つの
    @IBAction func tsuno_button(_ sender: UIButton) {
        myAp.shop_item_number = 0
        myAp.NoAcoin_compare[0] = 0
        if(myAp.shop_buy_number[0] == 0){
            if(myAp.NoA_coin >= 10){
                myAp.NoAcoin_compare[0] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[0] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //青眼鏡
    @IBAction func bluemegane_button(_ sender: UIButton) {
        myAp.shop_item_number = 1
        myAp.NoAcoin_compare[1] = 0
        if(myAp.shop_buy_number[1] == 0){
            if(myAp.NoA_coin >= 20){
                myAp.NoAcoin_compare[1] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[1] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
        
    }
    //赤眼鏡
    @IBAction func redmegane_button(_ sender: UIButton) {
        myAp.shop_item_number = 2
        myAp.NoAcoin_compare[2] = 0
        if(myAp.shop_buy_number[2] == 0){
            if(myAp.NoA_coin >= 20){
                myAp.NoAcoin_compare[2] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[2] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //はっと
    @IBAction func hat_button(_ sender: UIButton) {
        myAp.shop_item_number = 3
        myAp.NoAcoin_compare[3] = 0
        if(myAp.shop_buy_number[3] == 0){
            if(myAp.NoA_coin >= 30){
                myAp.NoAcoin_compare[3] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[3] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //おはな
    @IBAction func flower_button(_ sender: UIButton) {
        myAp.shop_item_number = 4
        myAp.NoAcoin_compare[4] = 0
        if(myAp.shop_buy_number[4] == 0){
            if(myAp.NoA_coin >= 30){
                myAp.NoAcoin_compare[4] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[4] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //おにのおめん
    @IBAction func omen_button(_ sender: UIButton) {
        myAp.shop_item_number = 5
        myAp.NoAcoin_compare[5] = 0
        if(myAp.shop_buy_number[5] == 0){
            if(myAp.NoA_coin >= 50){
                myAp.NoAcoin_compare[5] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[5] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //猫
    @IBAction func cat_button(_ sender: UIButton) {
        myAp.shop_item_number = 6
        myAp.NoAcoin_compare[6] = 0
        if(myAp.shop_buy_number[6] == 0){
            if(myAp.NoA_coin >= 50){
                myAp.NoAcoin_compare[6] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[6] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //ティアラ
    @IBAction func tiara(_ sender: UIButton) {
        myAp.shop_item_number = 7
        myAp.NoAcoin_compare[7] = 0
        if(myAp.shop_buy_number[7] == 0){
            if(myAp.NoA_coin >= 80){
                myAp.NoAcoin_compare[7] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[7] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    //おうかん
    @IBAction func crown(_ sender: UIButton) {
        myAp.shop_item_number = 8
        myAp.NoAcoin_compare[8] = 0
        if(myAp.shop_buy_number[8] == 0){
            if(myAp.NoA_coin >= 100){
                myAp.NoAcoin_compare[8] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[8] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
    }
    
    @IBOutlet weak var tsuno_buy_after: UIImageView!
    @IBOutlet weak var bluemegane_buy_after: UIImageView!
    @IBOutlet weak var redmegane_buy_after: UIImageView!
    @IBOutlet weak var hat_buy_after: UIImageView!
    @IBOutlet weak var flower_buy_after: UIImageView!
    @IBOutlet weak var omen_buy_after: UIImageView!
    @IBOutlet weak var cat_buy_after: UIImageView!
    @IBOutlet weak var tiara_buy_after: UIImageView!
    @IBOutlet weak var crown_buy_after: UIImageView!
    
    @IBOutlet weak var tsuno_view: UIView!
    @IBOutlet weak var bluemegane_view: UIView!
    @IBOutlet weak var redmegane_view: UIView!
    @IBOutlet weak var hat_view: UIView!
    @IBOutlet weak var flower_view: UIView!
    @IBOutlet weak var omen_view: UIView!
    @IBOutlet weak var cat_view: UIView!
    @IBOutlet weak var tiara_view: UIView!
    @IBOutlet weak var crown_view: UIView!
    //ノアコインテキスト
    @IBOutlet weak var NoAcoin: UILabel!
    
    @IBAction func goShop(segue: UIStoryboardSegue){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults.register(defaults: ["NoA_coin" : 100,])
        
        buy_after()
        NoAcoin_show()
    }
    
    //ノアコインの表示
    func NoAcoin_show(){
        NoAcoin.text = String(userDefaults.object(forKey: "NoA_coin") as! Int)
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
    //売り切れボタンの反映
    func buy_after(){
//        if(myAp.shop_buy_number[0] == 1){
        if(userDefaults.object(forKey: "つの") as? Int == 1){
            tsuno_buy_after.image = UIImage(named: "売り切れ")
            tsuno_view.layer.cornerRadius = 4
            tsuno_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[1] == 1){
        if(userDefaults.object(forKey: "めがね_あお") as? Int == 1){
            bluemegane_buy_after.image = UIImage(named: "売り切れ")
            bluemegane_view.layer.cornerRadius = 4
            bluemegane_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[2] == 1){
        if(userDefaults.object(forKey: "めがね_あか") as? Int == 1){
            redmegane_buy_after.image = UIImage(named: "売り切れ")
            redmegane_view.layer.cornerRadius = 4
            redmegane_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[3] == 1){
        if(userDefaults.object(forKey: "はっと") as? Int == 1){
            hat_buy_after.image = UIImage(named: "売り切れ")
            hat_view.layer.cornerRadius = 4
            hat_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[4] == 1){
        if(userDefaults.object(forKey: "はな") as? Int == 1){
            flower_buy_after.image = UIImage(named: "売り切れ")
            flower_view.layer.cornerRadius = 4
            flower_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[5] == 1){
        if(userDefaults.object(forKey: "おにのお面") as? Int == 1){
            omen_buy_after.image = UIImage(named: "売り切れ")
            omen_view.layer.cornerRadius = 4
            omen_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[6] == 1){
        if(userDefaults.object(forKey: "ねこ") as? Int == 1){
            cat_buy_after.image = UIImage(named: "売り切れ")
            cat_view.layer.cornerRadius = 4
            cat_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[7] == 1){
        if(userDefaults.object(forKey: "ティアラ") as? Int == 1){
            tiara_buy_after.image = UIImage(named: "売り切れ")
            tiara_view.layer.cornerRadius = 4
            tiara_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
//        if(myAp.shop_buy_number[8] == 1){
        if(userDefaults.object(forKey: "おうかん") as? Int == 1){
            crown_buy_after.image = UIImage(named: "売り切れ")
            crown_view.layer.cornerRadius = 4
            crown_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
    }
}

extension ShopViewController: AVAudioPlayerDelegate {
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
