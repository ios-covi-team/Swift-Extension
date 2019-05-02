//
//  Array.swift
//  XocDia
//
//  Created by Mr.Robo on 12/4/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

extension Array {

    
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
    
    func mapData<T>(from:Int, to:Int, stride:Int,isValidate:Bool) -> [T] {
        
        var datas:[T] = []
        var value:T = "" as! T
        let mapTo = T.self
        
        for i in Swift.stride(from: from, to: to, by: stride) {
            if mapTo == String.self {
                if isValidate {
                    value = String().validateNautralNumber(number: i) as! T
                }else{
                    value = "\(i)" as! T
                    
                }
            }else if mapTo == Int.self{
                value = i as! T
            }
            datas.append(value)
        }
        
        return datas
    }
}


public protocol Groupable {
    associatedtype GroupingType : Hashable
    var grouping:GroupingType? {set get}
}

extension Array where Element:Groupable{
    typealias GroupingType = Element.GroupingType
    func grouped() -> [[Element]] {
        var groups = [GroupingType:[Element]]()
        for element in self {
            if let _ = groups[element.grouping!]{
                groups[element.grouping!]?.append(element)
            }else{
                groups[element.grouping!] = [element]
            }
        }
        print(groups)
        return Array<[Element]>(groups.values)
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
