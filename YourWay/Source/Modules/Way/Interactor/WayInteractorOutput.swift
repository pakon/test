//
//  WayWayInteractorOutput.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import Foundation

protocol WayInteractorOutput: class {
    func received(steps: [Step])
}
