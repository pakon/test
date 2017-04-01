//
//  YourWayButton.swift
//  YourWay
//
//  Created by Valentin Popkov on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

@IBDesignable
class YourWayButton: UIButton {
    
    private struct Const {
        static let verticalContentInset: CGFloat = 12
        static let horizontalContentInset: CGFloat = 70
        static let cornerRadius: CGFloat = 10
    }
    
    private var topBottomContentInset: CGFloat {
        return 12
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupDefaults()
    }
    
    override func prepareForInterfaceBuilder() {
        setupDefaults()
    }
    
    private func setupDefaults() {
        if buttonType == .custom {
            if backgroundImage(for: .normal) == nil {
                setBackgroundImage(UIImage.imageFromColor(.yourWayYellow), for: .normal)
            }
            
            if titleColor(for: .normal) == UIButton(type: .custom).titleColor(for: .normal)! {
                setTitleColor(UIColor.yourWayButtonTitle, for: .normal)
            }
            
            if UIEdgeInsetsEqualToEdgeInsets(contentEdgeInsets, UIEdgeInsetsMake(0, 0, 0, 0)) {
                contentEdgeInsets = UIEdgeInsetsMake(Const.verticalContentInset, Const.horizontalContentInset, Const.verticalContentInset, Const.horizontalContentInset)
            }
            
            layer.cornerRadius = Const.cornerRadius
            layer.masksToBounds = true
            layer.shadowColor = UIColor(white: 0, alpha: 0.5).cgColor
            layer.shadowRadius = 4
            
        }
    }
}
