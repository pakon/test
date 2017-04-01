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
    
    private var yellowView: UIView = UIView()
    
    override var frame: CGRect {
        didSet {
            yellowView.frame = bounds
        }
    }
    
    private struct Const {
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
            backgroundColor = UIColor.clear
            
            if titleColor(for: .normal) == UIButton(type: .custom).titleColor(for: .normal)! {
                setTitleColor(UIColor.yourWayButtonTitle, for: .normal)
            }
    
            addSubview(yellowView)
            yellowView.backgroundColor = UIColor.yourWayYellow
            yellowView.isUserInteractionEnabled = false
            yellowView.layer.masksToBounds = true
            yellowView.layer.cornerRadius = Const.cornerRadius
            yellowView.clipsToBounds = true
            
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 10
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize()
            layer.shouldRasterize = true;
            layer.rasterizationScale = UIScreen.main.scale;
            layer.masksToBounds = false
            clipsToBounds = false
        }
    }
}
