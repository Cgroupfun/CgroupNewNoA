//
//  KisekaeViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/12.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class KisekaeViewController: UIViewController {
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var sample: UIImageView!
    
    @IBAction func kettei_botton(_ sender: UIButton) {
//        let backImg = UIImage(named: "noa_ver2") //背景画像
//        let ufoImg = UIImage(named: myAp.item_image[item_number]) //上に合成する画像
//        //オフスクリーンのContext作る
//        UIGraphicsBeginImageContext(view.frame.size)
//        //背景をContextに描画
//        backImg?.draw(in: CGRect(origin: CGPoint.zero, size: view.frame.size))
//        //合成する画像を位置を指定して描画
//        ufoImg?.draw(in: CGRect(x: 100, y: 100, width: 242, height: 140))
//        //context上に合成された画像を得る
//        let compositedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        sample.image = compositedImage
    }
    
    @IBOutlet weak var NoA_item: UIImageView!
    //画像番号定数
    var item_number:Int = 0
    
    //画像表示関数
    func itemimage_information(){
        let imagename = myAp.item_image[item_number]
        if  (imagename == "帽子_赤") || (imagename == "帽子_青"){
            NoA_item.frame = CGRect(x:140, y:105, width:121, height:43)
        }else if(imagename == "ツノ_青"){
            NoA_item.frame = CGRect(x:170, y:80, width:29, height:54)
        }
        let itemimage = UIImage(named: imagename)
        NoA_item.image = itemimage
    }
    
    @IBAction func red_cap(_ sender: UIButton) {
        //画像番号
        item_number = 0
        //画像表示
        itemimage_information()
    }
    
    @IBAction func blue_cap(_ sender: UIButton) {
        //画像番号
        item_number = 1
        //画像表示
        itemimage_information()
    }
    //        itemView?.center = CGPoint(x:375.0/2+10, y:130)
    @IBAction func blue_tsuno(_ sender: UIButton) {
        //画像番号
        item_number = 2
        //画像表示
        itemimage_information()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景
        view.backgroundColor = UIColor(red: 0.984, green: 0.956, blue: 0.866, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
