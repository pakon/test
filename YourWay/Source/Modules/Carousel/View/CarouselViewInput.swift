//
//  CarouselCarouselViewInput.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

protocol CarouselViewInput: class {

    func setupInitialState()
    func setupStateForViewWillAppear()
    func setupStateForViewWillDisappear()
    
    func show(viewModels: [CarouselCardViewModel])
}
