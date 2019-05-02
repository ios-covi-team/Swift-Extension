//
//  Double.swift
//  Timetablr
//
//  Created by Mr.Robo on 7/19/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
import UIKit
extension Double{
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }

}
