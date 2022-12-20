//
//  Extensions.swift
//  ParentingSNS
//
//

import UIKit

extension UIView {
    
    public var width: CGFloat {
        return frame.size.width
    }
    public var height: CGFloat {
        return frame.size.height
    }
    public var top: CGFloat {
        return frame.origin.y
    }
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    public var left: CGFloat {
        return frame.origin.x
    }
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
}

extension String {
     func safeDatabaseKey() -> String{
        return self.replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}

extension UIFont {
    static func circular(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-Black", size: size)
    }
    static func circularItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-BlackItalic", size: size)
    }
    static func circularBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-Bold", size: size)
    }
    static func circularBoldItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-BoldItalic", size: size)
    }
    static func circularBook(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-Book", size: size)
    }
    static func circularBookItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-BookItalic", size: size)
    }
    static func circularMedium(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-Medium", size: size)
    }
    static func circularMediumItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: "CircularStd-MediumItalic", size: size)
    }
}

extension UIColor {
    static func warmGrey() -> UIColor {
        return UIColor(white: 128.0 / 255.0, alpha: 1.0)
    }
    static func pinkishGrey() -> UIColor {
        return UIColor(white: 204.0 / 255.0, alpha: 1.0)
    }
    static func greyishBrown() -> UIColor {
        return UIColor(white: 69.0 / 255.0, alpha: 1.0)
    }
    static func white() -> UIColor {
        return UIColor(white: 230.0 / 255.0, alpha: 1.0)
    }
}

