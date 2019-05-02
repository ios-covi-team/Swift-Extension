//
//  UIImageViews.swift
//  Timetablr
//
//  Created by Mr.Robo on 1/22/19.
//  Copyright © 2019 eXNodes. All rights reserved.
//

import Foundation
extension UIImageView{
    
    func scale(width:Int, height:Int,image:UIImage)->UIImage{
        if width == 0 || height == 0{
            return image
        }
        
        let ratioImage = Float(height) / Float(width)
        let ratioImageView = Float(self.frame.size.height / self.frame.size.width)
        var newHeight:CGFloat = 0.0
        var newWidth:CGFloat = 0.0
        
        if ratioImageView > ratioImage {
            //stick height
            newHeight = self.frame.size.height
            newWidth = newHeight/CGFloat(ratioImageView)
        }else{
            //stick width
            newWidth = self.frame.size.width
            newHeight = newWidth/CGFloat(ratioImageView)

        }
        
        return image//.resizeImage(targetSize: CGSize(width: newHeight, height: newHeight))
    }
}
