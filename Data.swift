//
//  Data.swift
//  Timetablr
//
//  Created by Mr.Robo on 11/30/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
extension Data {
    func hex(separator:String = "") -> String {
        return (self.map { String(format: "%02X", $0) }).joined(separator: separator)
    }
}
