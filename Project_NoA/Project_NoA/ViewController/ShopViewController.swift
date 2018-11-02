//
//  ShopViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/19.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBAction func tsuno_button(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
        
        let popupView2: ShopPopupViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup") as! ShopPopupViewController
        popupView2.modalPresentationStyle = .overFullScreen
        popupView2.modalTransitionStyle = .crossDissolve
        
        self.present(popupView2, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
