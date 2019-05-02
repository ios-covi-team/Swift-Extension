 //
//  String.swift
//  TimeTable
//
//  Created by Mr.Robo on 11/28/17.
//  Copyright © 2017 Mr.Robo. All rights reserved.
//

import Foundation
import UIKit

 class App {
    class var name:String{
        if let displayName = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String {
            return  displayName
        }
        
        return ""
    }
    
    class var version:String{
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        
        return ""
    }
    
    class var build:String{
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return build
        }
        
        return ""
    }
    
 }
 
extension String {
    static let ACCEPTABLE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"

    var removeSpecialChar:String {
        let specialChar = Set("~`!@#$%^&*()+=-/;:\"\'{}[]<>^?|.,")
        return self.filter {!specialChar.contains($0) }
    }
    
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }

    func trimSpace() -> String {
        return self.filter { $0 != Character(" ") }
    }
    
    var wordUppercased: String {
        let words = self.components(separatedBy: " ")
        var newString:String = ""
        for i in 0..<words.count {
            let word = words[i]
            if i >= 1 {
                newString.append(" " + word.firstCharacterUpperCase())
            }else{
                newString.append(word.firstCharacterUpperCase())
            }
        }
        
//        if newString.hasSuffix(" ") {
//            newString.remove(at: newString.endIndex)
//        }
        
        return newString
    }
    
    
    func firstCharacterUpperCase() -> String {
        if let firstCharacter = self.first {
            return replacingCharacters(in: startIndex..<index(after: startIndex), with: String(firstCharacter).uppercased())
        }
        return ""
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedStringKey: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedStringKey: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var html2AttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }

        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    
    func html(content:String,textView:UITextView) -> String {
        let attrStr = NSAttributedString(string: content)
        let documentAttributes = [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html]
        do {
            let htmlData = try attrStr.data(from: NSMakeRange(0, attrStr.length), documentAttributes:documentAttributes)
            if let htmlString = String(data:htmlData, encoding:String.Encoding.utf8) {
                print(htmlString)
                return htmlString
            }
        }
        catch {
            print("error creating HTML from Attributed String")
        }
        
        return ""
        //        var htmlContent:String = ""
        //        let contents = content.components(separatedBy: "\n")
        //        if contents.count > 0 {
        //            for ct in contents {
        //                htmlContent.append("<p>\(ct)</p>")
        //            }
        //        }else{
        //           htmlContent = content
        //        }
        //
        //        let htmlContentFinal = String(format:"<span style=\"font-family:\(textView.font?.fontName ?? "HelveticaNeue"); font-size: \((textView.font?.pointSize)! + 1 )\">\(htmlContent)</span>")
        //        return htmlContentFinal
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

    
    func validateNautralNumber(number:Int) -> String {
        if number > 9 {
            return "\(number)"
        }
        
        return "0\(number)"
    }
    
    func stringBase64Image(_ image: UIImage) -> String {
        let imageData = UIImageJPEGRepresentation(image,0.5)
        let strBase64 = imageData?.base64EncodedString(options: .lineLength64Characters)
        return strBase64!
    }
    
    func substringFrom(_ from: Int) -> String {
        if from < 0 {
            return ""
        }
        let start = index(startIndex, offsetBy: from)
        return String(self[start ..< endIndex])
    }
    
    func substringTo(_ to: Int) -> String {
        if to < 0 {
            return ""
        }
        let index = self.index(self.startIndex, offsetBy: to)
        return String(self[..<index]) //
        
    }
    
    func textFiedlshouldChangeCharactersIn(string:String?, textField:UITextField?) -> String? {
        var keyword: String = ""
        if (string?.isEmpty)!{
            //clear
            if let text = textField?.text{
                keyword = text.substringTo((textField?.text?.count)! - 1)
                
            }
        }else{
            keyword = (textField?.text!)! + string!
        }
        
        return keyword
    }
    
    func textViewlshouldChangeCharactersIn(string:String?, textView:UITextView?) -> String? {
        var keyword: String = ""
        if (string?.isEmpty)!{
            //clear
            if let text = textView?.text{
                keyword = text.substringTo((textView?.text?.count)! - 1)
                
            }
        }else{
            keyword = (textView?.text!)! + string!
        }
        
        return keyword
    }
    
    
    func addingPercentEncodingForQueryParameter() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
    }


}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = "#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)

        return allowed
    }()
}
 
 extension NSAttributedString{
    func customAttributedText(firstString:String,
                                    lastString:String,
                                    fontSize:CGFloat, color:UIColor) -> NSMutableAttributedString {
        
        let string = "\(firstString )\(lastString )"
        let range: NSRange = (string as NSString).range(of: lastString)
        
        let attributedText:NSMutableAttributedString = NSMutableAttributedString.init(string: string)
        attributedText.setAttributes([kCTFontAttributeName as NSAttributedStringKey:UIFont.systemFont(ofSize: fontSize)], range: range)
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: color , range: range)

        return attributedText
    }
 }

