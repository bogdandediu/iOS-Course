//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bogdan Dediu on 12.08.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var calculatedAmount: String?
    var settings: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calculatedAmount
        settingsLabel.text = settings
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
