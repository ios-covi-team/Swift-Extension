//
//  UIAlertController.swift
//  Timetablr
//
//  Created by Mr.Robo on 1/30/19.
//  Copyright © 2019 eXNodes. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    var window: UIWindow? {
        get {
            return objc_getAssociatedObject(self, "window") as? UIWindow
        }
        set {
            objc_setAssociatedObject(self, "window", newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.window?.isHidden = true
        self.window = nil
    }
    
    func show(animated: Bool = true) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController(nibName: nil, bundle: nil)
        
        let delegate = UIApplication.shared.delegate
        if delegate?.window != nil {
            window.tintColor = delegate!.window!!.tintColor
        }
        
        window.windowLevel = UIApplication.shared.windows.last!.windowLevel + 1
        
        window.makeKeyAndVisible()
        window.rootViewController!.present(self, animated: animated, completion: nil)
        
        self.window = window
    }
}
