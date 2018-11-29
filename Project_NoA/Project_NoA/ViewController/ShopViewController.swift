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
        
        userDefaults.register(defaults: ["NoA_coin" : 300])
        
        buy_after()
        NoAcoin_show()
    }
    //購入アイテムを押した時の関数
    func itemReaction(buynumber:Int, price:Int){
        myAp.shop_item_number = buynumber
        myAp.NoAcoin_compare[buynumber] = 0
        if(myAp.shop_buy_number[buynumber] == 0){
            if(userDefaults.object(forKey: "NoA_coin") as! Int >= price){
                myAp.NoAcoin_compare[buynumber] = 1
                playSound(name: "sousaon")
                popup()
            }
            if (myAp.shop_buy_number[buynumber] == 0){
                playSound(name: "sousaon")
                popup()
            }
        }
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
    //売り切れ画像の反映
    func buyover(buyimage:UIImageView, clearView:UIView){
        buyimage.image = UIImage(named: "売り切れ")
        clearView.layer.cornerRadius = 4
        clearView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    //売り切れボタンの反映
    func buy_after(){
        if(userDefaults.object(forKey: "つの") as? Int == 1){
            buyover(buyimage: tsuno_buy_after, clearView: tsuno_view)
        }
        if(userDefaults.object(forKey: "めがね_あお") as? Int == 1){
            buyover(buyimage: bluemegane_buy_after, clearView: bluemegane_view)
        }
        if(userDefaults.object(forKey: "めがね_あか") as? Int == 1){
            buyover(buyimage: redmegane_buy_after, clearView: redmegane_view)
        }
        if(userDefaults.object(forKey: "はっと") as? Int == 1){
            buyover(buyimage: hat_buy_after, clearView: hat_view)
        }
        if(userDefaults.object(forKey: "はな") as? Int == 1){
            buyover(buyimage: flower_buy_after, clearView: flower_view)
        }
        if(userDefaults.object(forKey: "おにのお面") as? Int == 1){
            buyover(buyimage: omen_buy_after, clearView: omen_view)
        }
        if(userDefaults.object(forKey: "ねこ") as? Int == 1){
            buyover(buyimage: cat_buy_after, clearView: cat_view)
        }
        if(userDefaults.object(forKey: "ティアラ") as? Int == 1){
            buyover(buyimage: tiara_buy_after, clearView: tiara_view)
        }
        if(userDefaults.object(forKey: "おうかん") as? Int == 1){
            buyover(buyimage: crown_buy_after, clearView: crown_view)
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
