//
//  UITableViewCell.swift
//  Timetablr
//
//  Created by Mr.Robo on 9/11/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    var firstCellVisble:UITableViewCell{
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = self.cellForRow(at: indexPath) else {
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func cellVisble(row:Int, section:Int) -> UITableViewCell{
        let indexPath = IndexPath(row: row, section: section)
        guard let cell = self.cellForRow(at: indexPath) else {
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    func scrollToTop(animate:Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            self.scrollToRow(at: indexPath, at: .top, animated: animate)
        }
    }

    func scrollToBottom(row:Int,section:Int) {
        let indexPath = IndexPath(row: row, section:section)
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
    func reloadWithoutAnimation() {
        let lastScrollOffset = contentOffset
        reloadData()
        layoutIfNeeded()
        setContentOffset(lastScrollOffset, animated: false)
    }
    
    func heightOfVisibleCells() -> CGFloat {
        return self.visibleCells.map({ $0.frame.height }).reduce(0, +)
    }
    
}
