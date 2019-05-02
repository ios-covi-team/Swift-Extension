//
//  UIButton.swift
//  Timetablr
//
//  Created by Mr.Robo on 4/14/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func add (for controlEvents: UIControlEvents, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(ObjectIdentifier(self).hashValue) + String(controlEvents.rawValue), sleeve,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
