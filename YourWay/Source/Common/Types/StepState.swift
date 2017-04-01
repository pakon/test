//
//  StepState.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

enum StepState: Int {
    case complete = 0
    case inProgress = 1
    case delay = 2
    case missed = 3
    case future = 4
    case current = 5
    case failed = 6
    
    var icon: UIImage? {
        switch self {
            case .complete: return UIImage()
            case .inProgress: return UIImage()
            case .delay: return UIImage()
            case .missed: return UIImage()
            case .future: return UIImage()
            case .current: return UIImage()
            case .failed: return UIImage()
        }
    }
}
