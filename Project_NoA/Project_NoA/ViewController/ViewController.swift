//
//  ViewController.swift
//  Project_NoA
//
//  Created by 加藤景也 on 2018/09/28.
//  Copyright © 2018年 加藤景也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func modoru(segue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var NoA_Karada: UIImageView!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        //タップされた座標を調べる
        let tapPoint = sender.location(in: view)
        if tapPoint.y < 459.5 {
        print(tapPoint)
        
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
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

