//
//  CarouselCardViewController.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class CarouselCardViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cardText: UILabel!
    
    override func viewDidLoad() {
        view.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize()
    }
    
    override func viewDidLayoutSubviews() {
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
    }
    
    func setup(viewModel: CarouselCardViewModel) {
        imageView.image = viewModel.image
        cardText.text = viewModel.text
    }
}
