//
//  ShopPopup2ViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/11/13.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class ShopPopup2ViewController: UIViewController {

    @IBAction func back_shop(_ sender: UIButton) {
        if let controller = self.presentingViewController as? ShopViewController {
            controller.buy_after()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
