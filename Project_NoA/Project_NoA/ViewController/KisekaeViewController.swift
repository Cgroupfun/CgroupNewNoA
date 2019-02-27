//
//  KisekaeViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/12.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AWSS3
import AVFoundation

class KisekaeViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    let userDefaults = UserDefaults.standard
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func goKisekae(segue: UIStoryboardSegue) {
        playSound(name: "sousaon")
    }
    
    //決定ボタン
    @IBAction func kettei_botton(_ sender: UIButton) {
        let backImg = UIImage(named: "NoA_黄_全身1_嬉") //背景画像
        let ufoImg = UIImage(named: itemname) //上に合成する画像
        let ribbonimage = UIImage(named: ribbon)
        let meganeimage = UIImage(named: megane)
        //オフスクリーンのContext作る
        UIGraphicsBeginImageContext(CGSize(width: 128, height: 200))
        //背景をContextに描画
        backImg?.draw(in: CGRect(x: 5, y: 50, width: 118, height: 113))
        //合成する画像を位置を指定して描画
        if (itemname == "帽子_赤") || (itemname == "帽子_青"){
            ufoImg?.draw(in: CGRect(x: 33, y: 37, width:83, height:27))
        }else if (itemname == "かえる帽子"){
            ufoImg?.draw(in: CGRect(x: 6, y: 38, width:111, height:21))
        }else if (itemname == "星") || (itemname == "おばけ"){
            ufoImg?.draw(in: CGRect(x: 83, y: 55, width:29, height:25))
        }else if (itemname == "おうかん"){
            ufoImg?.draw(in: CGRect(x: 37, y: 15, width:55, height:44))
        }else if (itemname == "ティアラ"){
            ufoImg?.draw(in: CGRect(x: 37, y: 30, width:55, height:28))
        }else if (itemname == "つの"){
            ufoImg?.draw(in: CGRect(x: 56, y: 15, width:17, height:40))
        }else if (itemname == "ねこ"){
            ufoImg?.draw(in: CGRect(x: 38, y: 6, width:50, height:51))
        }else if (itemname == "はっと"){
            ufoImg?.draw(in: CGRect(x: 36, y: 21, width:58, height:44))
        }else if (itemname == "はな"){
            ufoImg?.draw(in: CGRect(x: 88, y: 57, width:21, height:21))
        }else if (itemname == "おにのお面"){
            ufoImg?.draw(in: CGRect(x: 3, y: 19, width:59, height:82))
        }
        //リボンの画像合成
        if (ribbon == "リボン_赤") || (ribbon == "リボン_青"){
            ribbonimage?.draw(in: CGRect(x: 50, y: 114, width:32, height:18))
        }
        //眼鏡の画像合成
        if (megane == "めがね_あか") || (megane == "めがね_あお"){
            meganeimage?.draw(in: CGRect(x: 41, y: 70, width:48, height:15))
        }
        //context上に合成された画像を得る
        let compositedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        //コンテキストを閉じる
        UIGraphicsEndImageContext()
        
        let NoA_data : Data = (UIImagePNGRepresentation(compositedImage!)! as NSData) as Data
        
        let data: Data =  NoA_data// Data to be uploaded
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue("public-read", forRequestHeader: "x-amz-acl")
        
        
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { (task, error) -> Void in
            DispatchQueue.main.async(execute: {
                // Do something e.g. Alert a user for transfer completion.
                // On failed uploads, ｀error｀ contains the error object.
            })
        }
        
        let transferUtility = AWSS3TransferUtility.default()
        
        transferUtility.uploadData(data,
                                   bucket: "noastorage",
                                   key: "noa_change.png",
                                   contentType:"image/png",
                                   expression: expression,
                                   completionHandler: completionHandler).continueWith {
                                    (task) -> AnyObject? in
                                    if let error = task.error {
                                        print("Error: \(error.localizedDescription)")
                                    }
                                    if let _ = task.result {
                                        // Do something with uploadTask.
                                        print("OK")
                                    }
                                    return nil;
        }
        
        //ホームノアイメージの更新
        myAp.NoA_compose = compositedImage
        if let controller = self.presentingViewController as? ViewController {
            controller.changeNoA()
        }
        playSound(name: "ketteion")
        popup()
    }
    
    @IBOutlet var NoA_additem: [UIImageView]!
    
//    @IBOutlet var KisekaeitemAfter: [UIImageView]!
    
    //ノアアイテム
    @IBOutlet weak var NoA_item: UIImageView!
    //リボン
    @IBOutlet weak var ribbon_image: UIImageView!
    //眼鏡
    @IBOutlet weak var megane_image: UIImageView!
    //画像番号定数
    var item_number:Int = 0
    //選択アイテム
    var itemname = ""
    var ribbon:String = ""
    var megane:String = ""
    //画像表示関数
    func itemimage_information(){
        var imagename:String
        if(item_number < 7){
            imagename = myAp.item_image[item_number]
        }else {
            imagename = userDefaults.object(forKey: myAp.buyitem_key[myAp.item_addnumber]) as! String
        }
        if  (imagename == "帽子_赤") || (imagename == "帽子_青"){
            itemname = imagename
            NoA_item.frame = CGRect(x:140, y:105, width:121, height:43)
        }else if (imagename == "リボン_赤") || (imagename == "リボン_青"){
            ribbon = imagename
            ribbon_image.frame = CGRect(x:165, y:218, width:46, height:29)
        }else if (imagename == "かえる帽子"){
            itemname = imagename
            NoA_item.frame = CGRect(x:100, y:112, width:161, height:33)
        }else if (imagename == "星") || (imagename == "おばけ"){
            itemname = imagename
            NoA_item.frame = CGRect(x:212, y:129, width:43, height:40)
        }else if (imagename == "おうかん"){
            itemname = imagename
            NoA_item.frame = CGRect(x:147, y:69, width:80, height:70)
        }else if (imagename == "ティアラ"){
            itemname = imagename
            NoA_item.frame = CGRect(x:146, y:95, width:80, height:45)
        }else if (imagename == "つの"){
            itemname = imagename
            NoA_item.frame = CGRect(x:173, y:70, width:25, height:64)
        }else if (imagename == "ねこ"){
            itemname = imagename
            NoA_item.frame = CGRect(x:147, y:56, width:73, height:82)
        }else if (imagename == "はっと"){
            itemname = imagename
            NoA_item.frame = CGRect(x:143, y:79, width:85, height:70)
        }else if (imagename == "めがね_あか") || (imagename == "めがね_あお"){
            megane = imagename
            megane_image.frame = CGRect(x:152, y:154, width:70, height:25)
        }else if (imagename == "はな"){
            itemname = imagename
            NoA_item.frame = CGRect(x:219, y:135, width:30, height:30)
        }else if (imagename == "おにのお面"){
            itemname = imagename
            NoA_item.frame = CGRect(x:94, y:79, width:85, height:130)
        }
        NoA_item.image = UIImage(named: itemname)
        ribbon_image.image = UIImage(named: ribbon)
        megane_image.image = UIImage(named: megane)
        playSound(name: "itemselectSound")
    }
    
    //アイテム表示関数
    func itemPresent(number: Int){
        //画像番号
        item_number = number
        //画像表示
        itemimage_information()
        playSound(name: "itemselectSound")
    }
    
    //追加アイテム表示関数
    func additemPresent(number: Int){
        //画像番号
        item_number = number
        if(userDefaults.object(forKey: myAp.buyitem_key[myAp.item_addnumber]) as! String != ""){
            //画像表示
            itemimage_information()
            playSound(name: "itemselectSound")
        }
    }
    
    //ぼうし_赤
    @IBAction func red_cap(_ sender: UIButton) {
        itemPresent(number: 0)
    }
    //ぼうし_青
    @IBAction func blue_cap(_ sender: UIButton) {
        itemPresent(number: 1)
    }
    //リボン_赤
    @IBAction func red_ribon(_ sender: UIButton) {
        itemPresent(number: 2)
    }
    //リボン_青
    @IBAction func blue_ribon(_ sender: UIButton) {
        itemPresent(number: 3)
    }
    //かえる
    @IBAction func flog(_ sender: UIButton) {
        itemPresent(number: 4)
    }
    //星
    @IBAction func star(_ sender: UIButton) {
        itemPresent(number: 5)
    }
    //おばけ
    @IBAction func gost(_ sender: UIButton) {
        itemPresent(number: 6)
    }
    @IBAction func item8(_ sender: UIButton) {
        myAp.item_addnumber = 0
        additemPresent(number: 7)
    }
    @IBAction func item9(_ sender: UIButton){
        myAp.item_addnumber = 1
        additemPresent(number: 8)
    }
    @IBAction func item10(_ sender: UIButton){
        myAp.item_addnumber = 2
        additemPresent(number: 9)
    }
    @IBAction func item11(_ sender: UIButton){
        myAp.item_addnumber = 3
        additemPresent(number: 10)
    }
    @IBAction func item12(_ sender: UIButton){
        myAp.item_addnumber = 4
        additemPresent(number: 11)
    }
    @IBAction func item13(_ sender: UIButton){
        myAp.item_addnumber = 5
        additemPresent(number: 12)
    }
    @IBAction func item14(_ sender: UIButton){
        myAp.item_addnumber = 6
        additemPresent(number: 13)
    }
    @IBAction func item15(_ sender: UIButton){
        myAp.item_addnumber = 7
        additemPresent(number: 14)
    }
    @IBAction func item16(_ sender: UIButton){
        myAp.item_addnumber = 8
        additemPresent(number: 15)
    }
    
    let item_xpoint:[Int] = [
        282,28,113,197,282,28,113,197,282
    ]
    
    let item_ypoint:[Int] = [
        404,490,490,490,490,575,575,575,575
    ]
    
    let item_addX:[Int] = [
        18,2,2,2,2,2,6,2,2
    ]
    
    let item_addY:[Int] = [
        0,23,23,8,3,-11,3,16,6
    ]
    //インベントリ表示画像のx幅
    let xitem_width:[Int] = [
        25,60,60,60,60,59,53,60,60
    ]
    //インベントリ表示画像のy幅
    let yitem_width:[Int] = [
        64,22,22,50,60,90,60,34,52
    ]
    //追加アイテムの表示位置
    func additem(){
        for i in (0...8){
            if(userDefaults.object(forKey: myAp.buyitem_key[i]) as! String != ""){
                NoA_additem[i].image = UIImage(named: userDefaults.object(forKey: myAp.buyitem_key[i]) as! String)
                item_place(additem: userDefaults.object(forKey: myAp.buyitem_key[i]) as! String, addImageView: NoA_additem[i], x_point: item_xpoint[i], y_point: item_ypoint[i])
            }
        }
    }
    
    //アイテム欄に表示する画像の位置
    func item_place(additem: String, addImageView: UIImageView, x_point:Int, y_point:Int){
        for i in (0...8){
            if (additem == myAp.shop_item[i]){
                addImageView.frame = CGRect(x:x_point + item_addX[i], y:y_point + item_addY[i], width:xitem_width[i], height:yitem_width[i])
            }
        }
    }
    
    //次のポップアップ表示
    func popup() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Kisekae", bundle: nil)
        let popupView2: KisekaePopupViewController = storyBoard.instantiateViewController(withIdentifier: "KisekaePopup") as! KisekaePopupViewController
        popupView2.modalPresentationStyle = .overFullScreen
        popupView2.modalTransitionStyle = .crossDissolve
        self.present(popupView2, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //アイテムの追加
        additem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension KisekaeViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
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
