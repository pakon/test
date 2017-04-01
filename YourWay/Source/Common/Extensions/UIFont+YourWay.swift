//
//  UIFont+YourWay.swift
//  YourWay
//
//  Created by Valentin Popkov on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

extension UIFont {
    
    public static let yourWayButtonTitleFontSize: CGFloat = 18.0
    
    public static func sfUI(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size)
    }
    
    public static func sfUIBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont.boldSystemFont(ofSize: size)
    }
}
