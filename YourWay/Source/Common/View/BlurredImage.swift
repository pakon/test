//
//  BlurredImage.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

extension UIImage {
    func blurred(radius: CGFloat) -> UIImage {
        let imageToBlur = CIImage(image: self)
        let blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter?.setValue(radius, forKey: kCIInputRadiusKey)
        blurfilter?.setValue(imageToBlur, forKey: "inputImage")
        let resultImage = blurfilter?.value(forKey: "outputImage") as! CIImage
        let cropped:CIImage = resultImage.cropping(to: CGRect(x: 0, y: 0, width: imageToBlur!.extent.size.width, height: imageToBlur!.extent.size.height))
        return UIImage(ciImage: cropped)
    }
}
