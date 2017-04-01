//
//  UIImage+YourWay.swift
//  YourWay
//
//  Created by Valentin Popkov on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

extension UIImage {
    static func imageFromColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func blurred(radius: CGFloat) -> UIImage? {
        return UIImage.ty_imageByApplyingBlur(to: self, withRadius: radius, tintColor: UIColor.clear, saturationDeltaFactor: 1, maskImage: nil)
    }
}
