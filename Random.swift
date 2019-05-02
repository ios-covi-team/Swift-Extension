//
//  Int.swift
//  XocDia
//
//  Created by Mr.Robo on 12/3/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import Foundation
public extension Int {
    static func random(from: Int, to: Int) -> Int {
        guard to > from else {
            assertionFailure("Can not generate negative random numbers")
            return 0
        }
        return Int(arc4random_uniform(UInt32(to - from)) + UInt32(from))
    }
    
    static func randomArrayItem(array: [Int]) -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        return array[randomIndex] 
    }
}

