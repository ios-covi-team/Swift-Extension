//
//  UIFont.swift
//  Timetablr
//
//  Created by Mr.Robo on 8/10/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
extension UIFont{
    var isBold: Bool
    {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isItalic: Bool
    {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    func setBold() -> UIFont
    {
        if(isBold)
        {
            return self
        }
        else
        {
            var fontAtrAry = fontDescriptor.symbolicTraits
            fontAtrAry.insert([.traitBold])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
    
    func setItalic()-> UIFont
    {
        if(isItalic)
        {
            return self
        }
        else
        {
            var fontAtrAry = fontDescriptor.symbolicTraits
            fontAtrAry.insert([.traitItalic])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
    func desetBold() -> UIFont
    {
        if(!isBold)
        {
            return self
        }
        else
        {
            var fontAtrAry = fontDescriptor.symbolicTraits
            fontAtrAry.remove([.traitBold])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
    
    func desetItalic()-> UIFont
    {
        if(!isItalic)
        {
            return self
        }
        else
        {
            var fontAtrAry = fontDescriptor.symbolicTraits
            fontAtrAry.remove([.traitItalic])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
}
