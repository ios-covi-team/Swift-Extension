//
//  DropDown.swift
//  Timetablr
//
//  Created by Mr.Robo on 5/25/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import DropDown
import Foundation
@objc protocol DropDownDeleagte {
    @objc optional func selectionAction(index:Int,cellIndex:IndexPath)
    @objc optional func selectionAction(index:Int,cellIndex:IndexPath?, tag:Int)
}

enum DropDownButtonTag:Int {
    case TimeTableMenu = 1
    var r: Int{
        return self.rawValue
    }
}
extension DropDown {
    func customizeDropDown(selectBtn:UIButton) {
        let appearance = DropDown.appearance()
        
        appearance.cellHeight = 35
        appearance.backgroundColor = UIColor(white: 1, alpha: 1)
        //appearance.selectionBackgroundColor = UIColor().hexStringToUIColor(hex: "#97B4D6")
        //        appearance.cornerRadius = 10
        appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
        appearance.shadowOpacity = 0.9
        appearance.shadowRadius = 25
        appearance.animationduration = 0.25
        appearance.textColor = UIColor().hexStringToUIColor(hex: "#97B4D6")
        var fontSize = 13.0 //default
        if selectBtn.tag ==  DropDownButtonTag.TimeTableMenu.r{
            fontSize = 16.0

        }
        appearance.textFont = UIFont.systemFont(ofSize: CGFloat(fontSize))
        self.anchorView = selectBtn
        self.bottomOffset = CGPoint(x: 0, y: selectBtn.bounds.height + 5)
        self.cellNib = UINib(nibName: "DropDownCellCustom", bundle: nil)
        self.direction = .bottom
        self.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? DropDownCellCustom else { return }
            cell.isUserInteractionEnabled = true
            self.selectedRowIndices.removeAll() // remove cell selected
            
            if selectBtn.tag ==  DropDownButtonTag.TimeTableMenu.r{
                cell.optionLabel.textAlignment = .center
            }
            if index == 0 {
//                let topArrow  = UIImageView()
//                topArrow.contentMode = .scaleAspectFit
//                topArrow.image = UIImage(named: "above_arrow")
//                topArrow.frame = CGRect(x: cell.frame.size.width/2, y: -10, width: 10, height: 10)
//                cell.contentView.addSubview(topArrow)

            }

        }
    }
    
    
    func disableRow(indexs:[Int]){
        self.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? DropDownCellCustom else { return }
            for i in indexs {
                if i == index.hashValue{
                    cell.isUserInteractionEnabled = false
                    cell.optionLabel?.textColor = .gray
                }else{
//                    cell.isUserInteractionEnabled = true
//                    cell.textLabel?.textColor = UIColor().hexStringToUIColor(hex: "#97B4D6")

                }
            }
        }
    }
    
    
}
