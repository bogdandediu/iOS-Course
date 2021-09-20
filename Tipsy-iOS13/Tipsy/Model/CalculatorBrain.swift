//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Bogdan Dediu on 12.08.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var values: Values?
    
    func getTip(percentage: String) -> Double{
        let tip = Double(percentage.dropLast())! / 100
        return tip
    }
    
    func getTotal(total: String) -> Double{
        return Double(total) ?? 0.0
    }
    
    func getCalculatedAmout() -> String {
        return values?.calculatedAmount ?? "0.0"
    }
    
    func getSettings() -> String {
        return values?.settings ?? "Split between 2 people, with 10% tip"
    }
    
    mutating func calculateTotal(total: Double, split: Int, tip: Double) {
        let calculatedAmount = String(format: "%.2f", (total + total * tip) / Double(split))
        let settings = "Split between \(split) people, with \(Int(tip * 100))% tip"
        values = Values(calculatedAmount: calculatedAmount, settings: settings)
    }
}
