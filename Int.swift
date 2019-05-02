//
//  Int.swift
//  XocDia
//
//  Created by Mr.Robo on 1/10/18.
//  Copyright © 2018 Macintosh. All rights reserved.
//

import Foundation
import UIKit
extension Int{
    func random(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func random(max:Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}
