//
//  ViewController.swift
//  KeyValuePicker
//
//  Created by ryota on 2020/06/03.
//  Copyright © 2020 ryota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var pickerView: UIPickerView = UIPickerView()
    let list: [(name: String, value: String)] = [("name1","value1"),("name2","value2"),("name3","value3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSUUID().uuidString)
        // ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
    }
    
   
    @objc func done() {
        textField.endEditing(true)
        textField.text = "\(list[pickerView.selectedRow(inComponent: 0)].name + list[pickerView.selectedRow(inComponent: 0)].value)"
    }
}
 

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
 
    // ドラムロールの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // ドラムロールの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return list.count
    }
    
    // ドラムロールの各タイトル
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return list[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = list[row].name + list[row].value
    }
}

