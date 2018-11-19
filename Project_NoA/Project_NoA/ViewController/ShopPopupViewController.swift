//
//  ShopPopupViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/11/02.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class ShopPopupViewController: UIViewController {
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    //アイテム画像
    @IBOutlet weak var shopitem: UIImageView!
    //買いますか？orポイント足りないよ
    @IBOutlet weak var buyquestion: UILabel!
    //買うボタン画像
    @IBOutlet weak var buy_image: UIImageView!
    //戻るボタン
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    //かうボタン
    @IBAction func nextButton(_ sender: UIButton) {
        if(myAp.NoAcoin_compare[myAp.shop_item_number] == 1){
            myAp.shop_buy_number[myAp.shop_item_number] = 1
            //コイン減少
            coin_down()
            if let controller = self.presentingViewController as? ShopViewController {
                controller.NoAcoin_show()
            }
            //売り切れ画像関数の実行
            if let controller = self.presentingViewController as? ShopViewController {
                controller.buy_after()
            }
            myAp.item_image[myAp.item_addnumber] = myAp.shop_item[myAp.shop_item_number]
            if(myAp.item_addnumber < 16){
                myAp.item_addnumber = myAp.item_addnumber + 1
            }
            
            if let controller = self.presentingViewController as? KisekaeViewController {
                controller.additem()
            }
            let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
            
            let popupView: ShopPopup2ViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup2") as! ShopPopup2ViewController
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
        }
    }
    
    func coin_down(){
        let imagename = myAp.shop_item[myAp.shop_item_number]
        if  (imagename == "つの") {
            myAp.NoA_coin = myAp.NoA_coin - 10
        }else if(imagename == "めがね_あお"){
            myAp.NoA_coin = myAp.NoA_coin - 20
        }else if(imagename == "めがね_あか"){
            myAp.NoA_coin = myAp.NoA_coin - 20
        }else if(imagename == "はっと"){
            myAp.NoA_coin = myAp.NoA_coin - 30
        }else if(imagename == "はな"){
            myAp.NoA_coin = myAp.NoA_coin - 30
        }else if(imagename == "おにのお面"){
            myAp.NoA_coin = myAp.NoA_coin - 50
        }else if(imagename == "ねこ"){
            myAp.NoA_coin = myAp.NoA_coin - 50
        }else if(imagename == "ティアラ"){
            myAp.NoA_coin = myAp.NoA_coin - 80
        }else if(imagename == "おうかん"){
            myAp.NoA_coin = myAp.NoA_coin - 100
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //アイテム画像の位置
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
        
        buybutton()
        
    }
    
}
