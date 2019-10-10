//
//  SecondViewController.swift
//  PassData_Protocol
//
//  Created by Jes Yang on 2019/10/9.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

protocol BackgroundColorDelegate {
    func colorSelected(_ color: UIColor)
}

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    enum ColorSet: Int, CaseIterable {
        case Red = 0, Green, Orange, Blue, Grey

        var description: String {
            switch self {
            case .Red: return "Red"
            case .Green: return "Green"
            case .Orange: return "Orange"
            case .Blue: return "Blue"
            case .Grey: return "Grey"
            }
        }
        
        var color: UIColor {
            switch self {
            case .Red: return UIColor.red
            case .Green: return UIColor.green
            case .Orange: return UIColor.orange
            case .Blue: return UIColor.blue
            case .Grey: return UIColor.gray
            }
        }
    }
    
    var backgroundColor = UIColor.white

    var bgDelegate: BackgroundColorDelegate?

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ColorSet.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return ColorSet.init(rawValue: row)?.description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        backgroundColor = ColorSet.init(rawValue: row)!.color
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        bgDelegate?.colorSelected(backgroundColor)
        dismiss(animated: true, completion: nil)
    }
}
