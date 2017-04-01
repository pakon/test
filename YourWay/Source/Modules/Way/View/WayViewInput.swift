//
//  WayWayViewInput.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

protocol WayViewInput: class {

    func setupInitialState()
    func setupStateForViewWillAppear()
    func setupStateForViewWillDisappear()
    
    func setup(viewModels: [WayStepViewModel], firstImagePath: URL, secondImagePath: URL)
    
    func updateBackgroundColor()
}
