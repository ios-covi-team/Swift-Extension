//
//  UIViewController.swift
//  TimeTable
//
//  Created by Mr.Robo on 1/4/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    var previousViewController:UIViewController?{
        var  controllersOnNavStack:[UIViewController] = []
        
        let root = UIApplication.shared.keyWindow?.rootViewController
        
        if root is CustomNavigationViewController {
            controllersOnNavStack = (UIApplication.topViewController()?.navigationController?.viewControllers)!
        }else{
            controllersOnNavStack = (CustomTabbarViewController.tabbar().naviContronller()?.viewControllers)!

        }
        let count = controllersOnNavStack.count
        if count >= 2 {
            return controllersOnNavStack[count - 2]
        }
        
        return nil


    }


}
