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
    
    @IBOutlet weak var itemnumber8: UIImageView!
    @IBOutlet weak var itemnumber9: UIImageView!
    @IBOutlet weak var itemnumber10: UIImageView!
    @IBOutlet weak var itemnumber11: UIImageView!
    @IBOutlet weak var itemnumber12: UIImageView!
    @IBOutlet weak var itemnumber13: UIImageView!
    @IBOutlet weak var itemnumber14: UIImageView!
    @IBOutlet weak var itemnumber15: UIImageView!
    @IBOutlet weak var itemnumber16: UIImageView!
    //画像番号定数
    var item_number:Int = 0
    
    //ノアにつける画像表示関数
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
    //アイテム追加関数
    func additem(){
        if(myAp.item_image[7] != ""){
            itemnumber8.image = UIImage(named: myAp.item_image[7])
            item_place(additem: myAp.item_image[7], addImageView: itemnumber8, x_point: 282, y_point: 404)
        }
        if(myAp.item_image[8] != ""){
            itemnumber9.image = UIImage(named: myAp.item_image[8])
            item_place(additem: myAp.item_image[8], addImageView: itemnumber9, x_point: 28, y_point: 490)
        }
        if(myAp.item_image[9] != ""){
            itemnumber10.image = UIImage(named: myAp.item_image[9])
            item_place(additem: myAp.item_image[9], addImageView: itemnumber10, x_point: 113, y_point: 490)
        }
        if(myAp.item_image[10] != ""){
            itemnumber11.image = UIImage(named: myAp.item_image[10])
            item_place(additem: myAp.item_image[10], addImageView: itemnumber11, x_point: 197, y_point: 490)
        }
        if(myAp.item_image[11] != ""){
            itemnumber12.image = UIImage(named: myAp.item_image[11])
            item_place(additem: myAp.item_image[11], addImageView: itemnumber12, x_point: 282, y_point: 490)
        }
        if(myAp.item_image[12] != ""){
            itemnumber13.image = UIImage(named: myAp.item_image[12])
            item_place(additem: myAp.item_image[12], addImageView: itemnumber13, x_point: 28, y_point: 575)
        }
        if(myAp.item_image[13] != ""){
            itemnumber14.image = UIImage(named: myAp.item_image[13])
            item_place(additem: myAp.item_image[13], addImageView: itemnumber14, x_point: 113, y_point: 575)
        }
        if(myAp.item_image[14] != ""){
            itemnumber15.image = UIImage(named: myAp.item_image[14])
            item_place(additem: myAp.item_image[14], addImageView: itemnumber15, x_point: 197, y_point: 575)
        }
        if(myAp.item_image[15] != ""){
            itemnumber16.image = UIImage(named: myAp.item_image[15])
            item_place(additem: myAp.item_image[15], addImageView: itemnumber16, x_point: 282, y_point: 575)
        }
    }
    //アイテム欄に表示する画像の位置
    func item_place(additem: String, addImageView: UIImageView, x_point:Int, y_point:Int){
        if (additem == "おうかん"){
            addImageView.frame = CGRect(x:x_point + 2, y:y_point + 6, width:60, height:52)
        }else if (additem == "ティアラ"){
            addImageView.frame = CGRect(x:x_point + 2, y:y_point + 16, width:60, height:34)
        }else if (additem == "つの"){
            addImageView.frame = CGRect(x:x_point + 18, y:y_point, width:25, height:64)
        }else if (additem == "ねこ"){
            addImageView.frame = CGRect(x:x_point + 6, y:y_point + 3, width:53, height:60)
        }else if (additem == "はっと"){
            addImageView.frame = CGRect(x:x_point + 2, y:y_point + 8, width:60, height:50)
        }else if (additem == "めがね_あか") || (additem == "めがね_あお"){
            addImageView.frame = CGRect(x:x_point + 2, y:y_point + 23, width:60, height:22)
        }else if (additem == "はな"){
            addImageView.frame = CGRect(x:x_point + 2, y:y_point + 3, width:60, height:60)
        }else if (additem == "おにのお面"){
            addImageView.frame = CGRect(x:x_point + 3, y:y_point - 11, width:59, height:90)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景
        view.backgroundColor = UIColor(red: 0.984, green: 0.956, blue: 0.866, alpha: 1.0)
        //アイテムの追加
        additem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
