//
//  UISearchBar.swift
//  Timetablr
//
//  Created by Mr.Robo on 9/15/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
extension UISearchBar{
    var textFiled:UITextField?{
        return self.value(forKey: "searchField") as? UITextField
    }


}

