//
//  UITableViewCell.swift
//  Timetablr
//
//  Created by Mr.Robo on 10/23/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    var indexPath:IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        
        let indexPath = superView.indexPath(for: self)
        return indexPath
    }
    
    func tableView() -> UITableView? {
        var currentView: UIView = self
        while let superView = currentView.superview {
            if superView is UITableView {
                return (superView as! UITableView)
            }
            currentView = superView
        }
        return nil
    }
}
