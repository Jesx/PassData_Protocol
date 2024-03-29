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
        case Grey = 0, Red, Green, Orange, Blue

        var description: String {
            switch self {
            case .Grey: return "Grey"
            case .Red: return "Red"
            case .Green: return "Green"
            case .Orange: return "Orange"
            case .Blue: return "Blue"
            }
        }
        
        var color: UIColor {
            switch self {
            case .Grey: return UIColor.gray
            case .Red: return UIColor.red
            case .Green: return UIColor.green
            case .Orange: return UIColor.orange
            case .Blue: return UIColor.blue
            }
        }
    }
    
    var backgroundColor = UIColor.white

    var delegate: BackgroundColorDelegate?

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        delegate?.colorSelected(backgroundColor)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - PickView Setting
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

}
