//
//  ShopViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/19.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    
    var myAp = UIApplication.shared.delegate as! AppDelegate

    @IBAction func tsuno_button(_ sender: UIButton) {
        myAp.shop_item_number = 0
        if (myAp.shop_buy_number[0] == 0){
            popup()
        }
    }
    //青眼鏡
    @IBAction func bluemegane_button(_ sender: UIButton) {
        myAp.shop_item_number = 1
        popup()
    }
    //赤眼鏡
    @IBAction func redmegane_button(_ sender: UIButton) {
        myAp.shop_item_number = 2
        popup()
    }
    //はっと
    @IBAction func hat_button(_ sender: UIButton) {
        myAp.shop_item_number = 3
        popup()
    }
    //おはな
    @IBAction func flower_button(_ sender: UIButton) {
        myAp.shop_item_number = 4
        popup()
    }
    //おにのおめん
    @IBAction func omen_button(_ sender: UIButton) {
        myAp.shop_item_number = 5
        popup()
    }
    //猫
    @IBAction func cat_button(_ sender: UIButton) {
        myAp.shop_item_number = 6
        popup()
    }
    //ティアラ
    @IBAction func tiara(_ sender: UIButton) {
        myAp.shop_item_number = 7
        popup()
    }
    //おうかん
    @IBAction func crown(_ sender: UIButton) {
        myAp.shop_item_number = 8
        popup()
    }
    
    @IBOutlet weak var tsuno_buy_after: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popup() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
        
        let popupView2: ShopPopupViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup") as! ShopPopupViewController
        popupView2.modalPresentationStyle = .overFullScreen
        popupView2.modalTransitionStyle = .crossDissolve
        
        self.present(popupView2, animated: false, completion: nil)
    }
    
    func buy_after(){
        if(myAp.shop_buy_number[myAp.shop_item_number] == 1){
            tsuno_buy_after.image = UIImage(named: "売り切れ")
        }
    }
}
