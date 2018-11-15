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
    //戻るボタン
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    //かうボタン
    @IBAction func nextButton(_ sender: UIButton) {
        myAp.item_image[myAp.item_addnumber] = myAp.shop_item[myAp.shop_item_number]
        if(myAp.item_addnumber < 16){
            myAp.item_addnumber = myAp.item_addnumber + 1
        }
        print(myAp.item_addnumber)
        
        if let controller = self.presentingViewController as? KisekaeViewController {
            controller.additem()
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
        
        let popupView: ShopPopup2ViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup2") as! ShopPopup2ViewController
        popupView.modalPresentationStyle = .overFullScreen
        popupView.modalTransitionStyle = .crossDissolve
        
        self.present(popupView, animated: false, completion: nil)
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
    }
    
}
