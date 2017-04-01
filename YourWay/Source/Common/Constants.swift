//
//  Constants.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit
import AVFoundation

enum ScreenType {
    case iphone5
    case iphone6
    case iphone6p
}

struct Constants {
    struct Screen {
        static let actualSize: ScreenType = {
            if UIScreen.main.bounds.maxY == 568 {
                return .iphone5
            } else if UIScreen.main.bounds.maxY == 667 {
                return .iphone6
            } else if UIScreen.main.bounds.maxY == 736 {
                return .iphone6p
            } else {
                return .iphone5
            }
        }()
    }
}
