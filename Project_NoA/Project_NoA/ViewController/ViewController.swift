//
//  ViewController.swift
//  Project_NoA
//
//  Created by 加藤景也 on 2018/09/28.
//  Copyright © 2018年 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation
import AWSDynamoDB
import AWSCore

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var myAp = UIApplication.shared.delegate as! AppDelegate
    let userDefaults = UserDefaults.standard
    //画像取得のための変数
    var task: URLSessionDataTask?
    var isActive: Bool = true
    
    //お着替えボタン
    @IBAction func gookigae(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //ショップ画面
    @IBAction func goshop(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //動画ボタン
    @IBAction func gomovie(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //設定ボタン
    @IBAction func gosetting(_ sender: UIButton) {
        playSound(name: "sousaon")
    }
    //戻るボタン
    @IBAction func modoru(segue: UIStoryboardSegue) {
        playSound(name: "sousaon")
    }
    //ノア本体
    @IBOutlet weak var NoA_Karada: UIImageView!
    //ノアが動く
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        //タップされた座標を調べる
        let tapPoint = sender.location(in: view)
        if tapPoint.y < 459.5 {
        
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        self.NoA_Karada.center = tapPoint
                        self.playSound(name: self.NoA_voice.randomElement()!)
        },
                       completion: nil)
        }
    }
    
    let NoA_voice:[String] = [
        "vc1","vc2","vc3","vc4","vc5","vc6","vc7","vc8","vc9","vc10","vc11","vc12"
    ]
    
    var NoAState = NoAClass()
    
    func NoAcoin_data(){
        let newsItem = NoAClass()
        newsItem!.ID = "NoA"
        
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDbObjectMapper.load(
            NoAClass.self,
            hashKey: newsItem!.ID as Any,
            rangeKey: nil,
            completionHandler: {
                (objectModel: AWSDynamoDBObjectModel?, error: Error?) -> Void in
                if let error = error {
                    print("Amazon DynamoDB Read Error: \(error)")
                    return
                }
                self.NoAState = (objectModel as! NoAClass)
                self.myAp.noaCoin = self.NoAState!.Coin
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //永続データの初期値
        userDefaults.register(defaults: [myAp.buyitem_key[0]   : "",
                                         myAp.buyitem_key[1]   : "",
                                         myAp.buyitem_key[2]   : "",
                                         myAp.buyitem_key[3]   : "",
                                         myAp.buyitem_key[4]   : "",
                                         myAp.buyitem_key[5]   : "",
                                         myAp.buyitem_key[6]   : "",
                                         myAp.buyitem_key[7]   : "",
                                         myAp.buyitem_key[8]   : "",
                                         "NoA_coin"            : 300,
                                         myAp.shopbuynumber[0] : 0,
                                         myAp.shopbuynumber[1] : 0,
                                         myAp.shopbuynumber[2] : 0,
                                         myAp.shopbuynumber[3] : 0,
                                         myAp.shopbuynumber[4] : 0,
                                         myAp.shopbuynumber[5] : 0,
                                         myAp.shopbuynumber[6] : 0,
                                         myAp.shopbuynumber[7] : 0,
                                         myAp.shopbuynumber[8] : 0,
                                         "buyturn"             : 0])
        //ホーム画面の背景
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "iPhone6_Top.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        NoAcoin_data()
        NoA_Image()
    }
    
    func changeNoA(){
        NoA_Karada.image = myAp.NoA_compose
        NoA_Karada.frame = CGRect(x:128, y:277, width:128, height:200)
    }
    
    func NoA_Image() -> Void {
        let url = URL(string:"https://s3-ap-northeast-1.amazonaws.com/noastorage/noa_change.png")!
        let conf = URLSessionConfiguration.default
        let session = URLSession(configuration: conf)
        task = session.dataTask(with: url) { (data, res, error) -> Void in
            if let e = error {
                print("dataTaskWithURL fail: \(e.localizedDescription)")
                return
            }
            if let d = data {
                let image = UIImage(data: d)
                DispatchQueue.main.async(execute: {
                    if self.isActive {
                        self.NoA_Karada.frame = CGRect(x:128, y:277, width:128, height:200)
                        self.NoA_Karada.image = image
                    }
                })
            }
        }
        return task!.resume()
    }
    
    struct Constants {
        static let TupacAmaruShakur = "NoA_Karada"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: AVAudioPlayerDelegate {
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
