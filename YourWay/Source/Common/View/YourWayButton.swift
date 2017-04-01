//
//  YourWayButton.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class YourWayButton: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
