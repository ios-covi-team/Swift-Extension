//
//  UIView.swift
//  TimeTable
//
//  Created by Mr.Robo on 11/28/17.
//  Copyright © 2017 Mr.Robo. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    @IBInspectable var cornerRadiusBtn: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthBtn: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorBtn: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var isShadow:Bool{
        get{
            return self.isShadow
        }
        
        set{
            if newValue{
                self.layer.shadowOpacity = 0.2
                self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                self.layer.shadowRadius = 3.0
                self.layer.shadowColor = UIColor.black.cgColor
//                self.layer.shadowRadius = 1
//                self.layer.cornerRadius = self.layer.shadowRadius
                
            }
            
        }
        
    }
    
    var textFieldsInView: [UITextView] {
        return subviews
            .filter ({ !($0 is UITextView) })
            .reduce (( subviews.compactMap { $0 as? UITextView }), { summ, current in
                return summ + current.textFieldsInView
            })
    }
    
    var textFiledIsActive:Bool{
        return  selectedTextField != nil ? true : false
    }
    
    var selectedTextField: UITextView? {
        return textFieldsInView.filter { $0.isFirstResponder }.first
    }
}
