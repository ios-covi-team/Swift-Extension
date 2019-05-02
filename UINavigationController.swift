//
//  UINavigationController.swift
//  TimeTable
//
//  Created by Mr.Robo on 11/28/17.
//  Copyright © 2017 Mr.Robo. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    var rootViewController : UIViewController? {
        return rootViewControllers.first
    }
    
    var rootViewControllers : [UIViewController]{
        return self.viewControllers
    }
}
