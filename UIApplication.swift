//
//  UIAplication.swift
//  TimeTable
//
//  Created by Mr.Robo on 11/28/17.
//  Copyright © 2017 Mr.Robo. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
    
    class func window() -> UIWindow {
        return UIApplication.shared.windows.first!
    }
    
}
