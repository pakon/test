//
//  CarouselCardViewController.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class CarouselCardViewController: UIViewController {
    func setup(viewModel: CarouselCardViewModel) {
        view.backgroundColor = viewModel.color
    }
}
