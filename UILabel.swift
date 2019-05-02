//
//  UILabel.swift
//  TimeTable
//
//  Created by Mr.Robo on 11/28/17.
//  Copyright © 2017 Mr.Robo. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
    func textHeight(withWidth width: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.height(withConstrainedWidth: width, font: self.font)
    }
}
