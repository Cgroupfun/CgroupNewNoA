//
//  KisekaeViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/12.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class KisekaeViewController: UIViewController {
    
    @IBOutlet weak var hat_blue: UIImageView!
    
    @IBAction func tapblue_hat(_ sender: Any) {
        // 画像はAssetsに入れてないのとjpgなので拡張子を入れます
        let image1:UIImage = UIImage(named:"帽子_青.png")!
        // UIImageView 初期化
        let imageView = UIImageView(image:image1)
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:375.0/2+10, y:130)
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
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
