//
//  ShopPopupViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/11/02.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class ShopPopupViewController: UIViewController {

    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shop", bundle: nil)
        
        let popupView: ShopPopup2ViewController = storyBoard.instantiateViewController(withIdentifier: "ShopPopup2") as! ShopPopup2ViewController
        popupView.modalPresentationStyle = .overFullScreen
        popupView.modalTransitionStyle = .crossDissolve
        
        self.present(popupView, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
