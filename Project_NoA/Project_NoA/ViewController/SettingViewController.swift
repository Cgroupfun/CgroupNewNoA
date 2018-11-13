//
//  MessageViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/12.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
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
        if pickerView.tag == 1{
            textField = color + " : " + model
            userDefaults.set(textField, forKey:"kisyo")
            userDefaults.synchronize()
            kisyo.text = userDefaults.object(forKey: "kisyo") as? String
        }
        if pickerView.tag == 2{
            textField2 = color + " : " + model
            userDefaults.set(textField2, forKey:"neru")
            userDefaults.synchronize()
            neru.text = userDefaults.object(forKey: "neru") as? String
        }
        if pickerView.tag == 3{
            textField3 = color + " : " + model
            userDefaults.set(textField3, forKey:"breakfast")
            userDefaults.synchronize()
            breakfast.text = userDefaults.object(forKey: "breakfast") as? String
        }
        if pickerView.tag == 4{
            textField4 = color + " : " + model
            userDefaults.set(textField4, forKey:"lunch")
            userDefaults.synchronize()
            lunch.text = userDefaults.object(forKey: "lunch") as? String
        }
        if pickerView.tag == 5{
            textField5 = color + " : " + model
            userDefaults.set(textField5, forKey:"dinner")
            userDefaults.synchronize()
            dinner.text = userDefaults.object(forKey: "dinner") as? String
        }
        if pickerView.tag == 6{
            textField6 = color + " : " + model
            userDefaults.set(textField6, forKey:"tooth")
            userDefaults.synchronize()
            tooth.text = userDefaults.object(forKey: "tooth") as? String
        }
        if pickerView.tag == 7{
            textField7 = color + " : " + model
            userDefaults.set(textField7, forKey:"tooth2")
            userDefaults.synchronize()
            tooth2.text = userDefaults.object(forKey: "tooth2") as? String
        }
        if pickerView.tag == 8{
            textField8 = color + " : " + model
            userDefaults.set(textField8, forKey:"tooth3")
            userDefaults.synchronize()
            tooth3.text = userDefaults.object(forKey: "tooth3") as? String
        }
        if pickerView.tag == 9{
            textField9 = color + " : " + model
            userDefaults.set(textField9, forKey:"tooth4")
            userDefaults.synchronize()
            tooth4.text = userDefaults.object(forKey: "tooth4") as? String
        }
        if pickerView.tag == 10{
            textField10 = color + " : " + model
            userDefaults.set(textField10, forKey:"medi_breakfast")
            userDefaults.synchronize()
            medi_breakfast.text = userDefaults.object(forKey: "medi_breakfast") as? String
        }
        if pickerView.tag == 11{
            textField11 = color + " : " + model
            userDefaults.set(textField11, forKey:"medi_lunch")
            userDefaults.synchronize()
            medi_lunch.text = userDefaults.object(forKey: "medi_lunch") as? String
        }
        if pickerView.tag == 12{
            textField12 = color + " : " + model
            userDefaults.set(textField12, forKey:"medi_dinner")
            userDefaults.synchronize()
            medi_dinner.text = userDefaults.object(forKey: "medi_dinner") as? String
        }
    }
   
    @IBOutlet weak var kisyo: UITextField!
    @IBOutlet weak var neru: UITextField!
    @IBOutlet weak var breakfast: UITextField!
    @IBOutlet weak var lunch: UITextField!
    @IBOutlet weak var dinner: UITextField!
    @IBOutlet weak var tooth: UITextField!
    @IBOutlet weak var tooth2: UITextField!
    @IBOutlet weak var tooth3: UITextField!
    @IBOutlet weak var tooth4: UITextField!
    @IBOutlet weak var medi_breakfast: UITextField!
    @IBOutlet weak var medi_lunch: UITextField!
    @IBOutlet weak var medi_dinner: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    var textField:String = ""
    var textField2:String = ""
    var textField3:String = ""
    var textField4:String = ""
    var textField5:String = ""
    var textField6:String = ""
    var textField7:String = ""
    var textField8:String = ""
    var textField9:String = ""
    var textField10:String = ""
    var textField11:String = ""
    var textField12:String = ""
    
    var pickOption = [["7","8","9","10","11", "12", "13","14","15","16","17","18","19","20","21"], ["00", "15","30","45",]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景
        view.backgroundColor = UIColor(red: 0.984, green: 0.956, blue: 0.866, alpha: 1.0)
        //起床
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.tag = 1
        kisyo.inputView = pickerView
        kisyo.text = userDefaults.object(forKey: "kisyo") as? String
        //就寝
        let pickerView2 = UIPickerView()
        pickerView2.delegate = self
        pickerView2.tag = 2
        neru.inputView = pickerView2
        neru.text = userDefaults.object(forKey: "neru") as? String
        //朝食
        let pickerView3 = UIPickerView()
        pickerView3.delegate = self
        pickerView3.tag = 3
        breakfast.inputView = pickerView3
        breakfast.text = userDefaults.object(forKey: "breakfast") as? String
        //昼食
        let pickerView4 = UIPickerView()
        pickerView4.delegate = self
        pickerView4.tag = 4
        lunch.inputView = pickerView4
        lunch.text = userDefaults.object(forKey: "lunch") as? String
        //夕食
        let pickerView5 = UIPickerView()
        pickerView5.delegate = self
        pickerView5.tag = 5
        dinner.inputView = pickerView5
        dinner.text = userDefaults.object(forKey: "dinner") as? String
        //歯磨き
        let pickerView6 = UIPickerView()
        pickerView6.delegate = self
        pickerView6.tag = 6
        tooth.inputView = pickerView6
        tooth.text = userDefaults.object(forKey: "tooth") as? String
        //歯磨き2
        let pickerView7 = UIPickerView()
        pickerView7.delegate = self
        pickerView7.tag = 7
        tooth2.inputView = pickerView7
        tooth2.text = userDefaults.object(forKey: "tooth2") as? String
        //歯磨き3
        let pickerView8 = UIPickerView()
        pickerView8.delegate = self
        pickerView8.tag = 8
        tooth3.inputView = pickerView8
        tooth3.text = userDefaults.object(forKey: "tooth3") as? String
        //歯磨き4
        let pickerView9 = UIPickerView()
        pickerView9.delegate = self
        pickerView9.tag = 9
        tooth4.inputView = pickerView9
        tooth4.text = userDefaults.object(forKey: "tooth4") as? String
        //薬_朝食
        let pickerView10 = UIPickerView()
        pickerView10.delegate = self
        pickerView10.tag = 10
        medi_breakfast.inputView = pickerView10
        medi_breakfast.text = userDefaults.object(forKey: "medi_breakfast") as? String
        //薬_昼食
        let pickerView11 = UIPickerView()
        pickerView11.delegate = self
        pickerView11.tag = 11
        medi_lunch.inputView = pickerView11
        medi_lunch.text = userDefaults.object(forKey: "medi_lunch") as? String
        //薬_夕食
        let pickerView12 = UIPickerView()
        pickerView12.delegate = self
        pickerView12.tag = 12
        medi_dinner.inputView = pickerView12
        medi_dinner.text = userDefaults.object(forKey: "medi_dinner") as? String
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
