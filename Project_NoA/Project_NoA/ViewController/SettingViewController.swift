//
//  MessageViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/12.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit
import AVFoundation
import AWSDynamoDB

//@objcMembers
class NoAClass: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    @objc var ID: String?
    @objc var wake: String?
    @objc var sleep: String?
    @objc var breakfast: String?
    @objc var lunch: String?
    @objc var dinner: String?
    @objc var study: String?
    @objc var tooth: String?
    @objc var tooth2: String?
    @objc var tooth3: String?
    @objc var drug_breakfast: String?
    @objc var drug_lunch: String?
    @objc var drug_dinner: String?
    @objc var noaCoin: Int = 0
    
    
    class func dynamoDBTableName() -> String {
        return "NoATable"
    }
    
    class func hashKeyAttribute() -> String {
        return "ID"
    }
}


class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var audioPlayer: AVAudioPlayer!
    let userDefaults = UserDefaults.standard
    
    @IBAction func goSetting(segue: UIStoryboardSegue) {
        playSound(name: "sousaon")
    }
    
    @IBAction func ketteiButton(_ sender: UIButton) {
        //DBに保存
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        // Create data object using data models you downloaded from Mobile Hub
        let NoAItem = NoAClass()
        NoAItem?.ID = "NoA"
        NoAItem?.wake           = lifeTextField[0].text
        NoAItem?.sleep          = lifeTextField[1].text
        NoAItem?.breakfast      = lifeTextField[2].text
        NoAItem?.lunch          = lifeTextField[3].text
        NoAItem?.dinner         = lifeTextField[4].text
        NoAItem?.study          = lifeTextField[5].text
        NoAItem?.tooth          = lifeTextField[6].text
        NoAItem?.tooth2         = lifeTextField[7].text
        NoAItem?.tooth3         = lifeTextField[8].text
        NoAItem?.drug_breakfast = lifeTextField[9].text
        NoAItem?.drug_lunch     = lifeTextField[10].text
        NoAItem?.drug_dinner    = lifeTextField[11].text
        
        //Save a new item
        dynamoDbObjectMapper.save(NoAItem!).continueWith(block: { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
            } else {
                print("できたよ")
            }
            return nil
        })
        
        playSound(name: "ketteion")
        popup()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let color = pickOption[0][pickerView.selectedRow(inComponent: 0)]
        let model = pickOption[1][pickerView.selectedRow(inComponent: 1)]
        for i in (1...12){
            if pickerView.tag == i{
                textStore(color: color, model: model, textnumber: i-1, textField: lifeTextField[i-1], textKey: lifeStyle[i-1]["textKey"] as! String)
            }
        }
    }
    //テキストデータ永続化関数
    func textStore(color:String ,model:String ,textnumber:Int, textField:UITextField, textKey:String){
        textData[textnumber] = color + " : " + model
        userDefaults.set(textData[textnumber], forKey:textKey)
        userDefaults.synchronize()
        textField.text = userDefaults.object(forKey: textKey) as? String
    }

    
    let lifeStyle = [
        ["textKey" : "kisyo", "pick" : UIPickerView()],
        ["textKey" : "neru", "pick" : UIPickerView()],
        ["textKey" : "breakfast","pick" : UIPickerView()],
        ["textKey" : "lunch","pick" : UIPickerView()],
        ["textKey" : "dineer","pick" : UIPickerView()],
        ["textKey" : "study","pick" : UIPickerView()],
        ["textKey" : "tooth","pick" : UIPickerView()],
        ["textKey" : "tooth2","pick" : UIPickerView()],
        ["textKey" : "tooth3","pick" : UIPickerView()],
        ["textKey" : "medi_breakfast","pick" : UIPickerView()],
        ["textKey" : "medi_lunch","pick" : UIPickerView()],
        ["textKey" : "medi_dineer","pick" : UIPickerView()]
    ]
    
    @IBOutlet var lifeTextField: [UITextField]!
    
    var textData:[String] = [
        "","","","","","","","","","","",""
    ]
    
    var pickOption = [["7","8","9","10","11", "12", "13","14","15","16","17","18","19","20","21"], ["00", "15","30","45",]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in (1...12){
            textPresent(pickerView: lifeStyle[i-1]["pick"] as! UIPickerView, tag: i, textField: lifeTextField[i-1], textKey: lifeStyle[i-1]["textKey"] as! String)
        }
    }
    //テキストデータ表示関数
    func textPresent(pickerView:UIPickerView, tag:Int, textField:UITextField, textKey:String){
        pickerView.delegate = self
        pickerView.tag = tag
        textField.inputView = pickerView
        textField.text = userDefaults.object(forKey: textKey) as? String
    }
    
    //次のポップアップ表示
    func popup() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Setting", bundle: nil)
        let popupView2: SettingPopupViewController = storyBoard.instantiateViewController(withIdentifier: "SettingPopup") as! SettingPopupViewController
        popupView2.modalPresentationStyle = .overFullScreen
        popupView2.modalTransitionStyle = .crossDissolve
        self.present(popupView2, animated: false, completion: nil)
    }
    //画面クリックしたらピッカービューを閉じる
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SettingViewController: AVAudioPlayerDelegate {
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
