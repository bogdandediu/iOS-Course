//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Bogdan Dediu on 11.08.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
