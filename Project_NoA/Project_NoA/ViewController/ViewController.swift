//
//  ViewController.swift
//  Project_NoA
//
//  Created by 加藤景也 on 2018/09/28.
//  Copyright © 2018年 加藤景也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func modoru(segue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var NoA_Karada: UIImageView!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        //タップされた座標を調べる
        let tapPoint = sender.location(in: view)
        if tapPoint.y < 459.5 {
        
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        self.NoA_Karada.center = tapPoint
        },
                       completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ホーム画面の背景
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "iPhone6_Top.png")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        NoA_Image()
    }
    
    func NoA_Image(){
        //ノアの画像表示
        if(myAp.NoA_compose == nil){
            NoA_Karada.frame = CGRect(x:128, y:277, width:118, height:113)
            NoA_Karada.image = UIImage(named: myAp.NoA_image[myAp.NoA_image_number])
        }else {
            NoA_Karada.frame = CGRect(x:128, y:277, width:128, height:200)
            NoA_Karada.image = myAp.NoA_compose
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

