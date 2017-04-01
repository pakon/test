//
//  UINavigationController+YourWay.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBlurNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
    }
}
