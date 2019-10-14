//
//  ViewController.swift
//  PassData_Protocol
//
//  Created by Jes Yang on 2019/10/9.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        secondVC.delegate = self
        // Can't combine with performSegue
        present(secondVC, animated: true, completion: nil)
    }
    
}

extension ViewController: BackgroundColorDelegate {
    func colorSelected(_ color: UIColor) {
        view.backgroundColor = color
    }
}

