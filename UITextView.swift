//
//  UITextView.swift
//  Timetablr
//
//  Created by Mr.Robo on 3/11/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
extension UITextView :UITextViewDelegate
{
    func numberOfLines() -> Int{
        if let fontUnwrapped = self.font{
            return Int(self.contentSize.height / fontUnwrapped.lineHeight)
        }
        return 0
    }
    
}
