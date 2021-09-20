

import Foundation

var width: Float = 1.5
var height: Float = 2.3

var bucketsOfPain: Int {
    get {
        return Int(ceilf(width * height / 1.5))
    }
    set {
        print("This amount of paint can cover \(Double(newValue) * 1.5) sqm")
    }
}

bucketsOfPain = 4
