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
        let backImg = UIImage(named: "noa_ver2") //背景画像
        let ufoImg = UIImage(named: myAp.item_image[item_number]) //上に合成する画像
        //オフスクリーンのContext作る
        UIGraphicsBeginImageContext(view.frame.size)
        //背景をContextに描画
//        backImg?.draw(in: CGRect(origin: CGPoint.zero, size: view.frame.size))
        backImg?.draw(at : CGPoint(x: 0, y: 0/*, width: 242, height: 140*/))
        //合成する画像を位置を指定して描画
        ufoImg?.draw(at : CGPoint(x: 100, y: 100/*, width: 242, height: 140*/))
        //context上に合成された画像を得る
        let compositedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
//        // ファイルパスを指定する
//        var imagePath: String {
//            let doc = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true )[0] as String
//            return ( doc as NSString ).appendingPathComponent( "send.jpg" )
//        }
//
//        // 指定したファイルパスに保存する
//        //let data: NSData = UIImageJPEGRepresentation(resizeImage, 0.9 )!
//        data.write( toFile: imagePath, atomically: true )
//
//        let transferFile: NSURL = NSURL( fileURLWithPath: imagePath )
//        WCSession.defaultSession().transferFile( transferFile, metadata: qrcodeImage.properties )
    }
    
    @IBOutlet weak var NoA_item: UIImageView!
    //画像番号定数
    var item_number:Int = 0
    
    //画像表示関数
    func itemimage_information(){
        let imagename = myAp.item_image[item_number]
        if  (imagename == "帽子_赤") || (imagename == "帽子_青"){
            NoA_item.frame = CGRect(x:140, y:105, width:121, height:43)
        }else if (imagename == "リボン_赤") || (imagename == "リボン_青"){
            NoA_item.frame = CGRect(x:165, y:218, width:46, height:29)
        }else if (imagename == "かえる帽子"){
            NoA_item.frame = CGRect(x:100, y:112, width:161, height:33)
        }else if (imagename == "星") || (imagename == "おばけ"){
            NoA_item.frame = CGRect(x:212, y:129, width:43, height:40)
        }else if (imagename == "おうかん"){
            NoA_item.frame = CGRect(x:147, y:69, width:80, height:70)
        }else if (imagename == "ティアラ"){
            NoA_item.frame = CGRect(x:146, y:95, width:80, height:45)
        }else if (imagename == "つの"){
            NoA_item.frame = CGRect(x:173, y:70, width:25, height:64)
        }else if (imagename == "ねこ"){
            NoA_item.frame = CGRect(x:147, y:56, width:73, height:82)
        }else if (imagename == "はっと"){
            NoA_item.frame = CGRect(x:143, y:79, width:85, height:70)
        }else if (imagename == "めがね_あか") || (imagename == "めがね_あお"){
            NoA_item.frame = CGRect(x:153, y:154, width:70, height:25)
        }else if (imagename == "はな"){
            NoA_item.frame = CGRect(x:219, y:135, width:30, height:30)
        }else if (imagename == "おにのお面"){
            NoA_item.frame = CGRect(x:94, y:79, width:85, height:130)
        }
        let itemimage = UIImage(named: imagename)
        NoA_item.image = itemimage
    }
    //ぼうし_赤
    @IBAction func red_cap(_ sender: UIButton) {
        //画像番号
        item_number = 0
        //画像表示
        itemimage_information()
    }
    //ぼうし_青
    @IBAction func blue_cap(_ sender: UIButton) {
        //画像番号
        item_number = 1
        //画像表示
        itemimage_information()
    }
    //リボン_赤
    @IBAction func red_ribon(_ sender: UIButton) {
        //画像番号
        item_number = 2
        //画像表示
        itemimage_information()
    }
    //リボン_青
    @IBAction func blue_ribon(_ sender: UIButton) {
        //画像番号
        item_number = 3
        //画像表示
        itemimage_information()
    }
    //かえる
    @IBAction func flog(_ sender: UIButton) {
        //画像番号
        item_number = 4
        //画像表示
        itemimage_information()
    }
    //星
    @IBAction func star(_ sender: UIButton) {
        //画像番号
        item_number = 5
        //画像表示
        itemimage_information()
    }
    //おばけ
    @IBAction func gost(_ sender: UIButton) {
        //画像番号
        item_number = 6
        //画像表示
        itemimage_information()
    }
    @IBAction func item8(_ sender: UIButton) {
        //画像番号
        item_number = 7
//        if(myAp.item_image[item_number] != ""){
        //画像表示
        itemimage_information()
//        }
    }
    @IBAction func item9(_ sender: UIButton){
        //画像番号
        item_number = 8
        //画像表示
        itemimage_information()
    }
    @IBAction func item10(_ sender: UIButton){
        //画像番号
        item_number = 9
        //画像表示
        itemimage_information()
    }
    @IBAction func item11(_ sender: UIButton){
        //画像番号
        item_number = 10
        //画像表示
        itemimage_information()
    }
    @IBAction func item12(_ sender: UIButton){
        //画像番号
        item_number = 11
        //画像表示
        itemimage_information()
    }
    @IBAction func item13(_ sender: UIButton){
        //画像番号
        item_number = 12
        //画像表示
        itemimage_information()
    }
    @IBAction func item14(_ sender: UIButton){
        //画像番号
        item_number = 13
        //画像表示
        itemimage_information()
    }
    @IBAction func item15(_ sender: UIButton){
        //画像番号
        item_number = 14
        //画像表示
        itemimage_information()
    }
    @IBAction func item16(_ sender: UIButton){
        //画像番号
        item_number = 15
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
