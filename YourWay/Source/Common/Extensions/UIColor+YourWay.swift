//
//  UIColor+YourWay.swift
//  YourWay
//
//  Created by Valentin Popkov on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var yourWayYellow: UIColor {
        return UIColor(rgb: 0xFAFA00)
    }
    
    static var yourWayButtonTitle: UIColor {
        return .black
    }
    
    static var yourWayError: UIColor {
        return UIColor(rgb: 0xFD4F50)
    }
    
    static var yourWayShadowGradientColor: UIColor {
        return UIColor(red: 44, green: 44, blue: 44, a: 204)
    }
    
    static var yourWayGradientGray: UIColor {
        return UIColor(rgb: 0x5C5C5C)
    }
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 255) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(a >= 0 && a <= 255, "Invalid alpha component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(rgba: Int) {
        self.init(
            red: (rgba >> 24) & 0xFF,
            green: (rgba >> 16) & 0xFF,
            blue: (rgba >> 8) & 0xFF,
            a: rgba & 0xFF
        )
    }
}
