//
//  CarouselCardViewController.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit
import Kingfisher

class CarouselCardViewController: UIViewController {
    
    struct Const {
        static let cornerRadius: CGFloat = 10
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cardText: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        view.layer.cornerRadius = Const.cornerRadius
        imageView.layer.cornerRadius = Const.cornerRadius
        gradientView.layer.cornerRadius = Const.cornerRadius
        imageView.clipsToBounds = true
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize()
        view.layer.shouldRasterize = true;
        view.layer.rasterizationScale = UIScreen.main.scale;
        view.layer.masksToBounds = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        
        view.layoutIfNeeded()
        let gl = CAGradientLayer()
        gl.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gl.frame = gradientView.bounds
        gl.startPoint = CGPoint(x: 1.0, y: 0.0)
        gl.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gl.locations = [0.0, 1.0]
        gradientView.layer.addSublayer(gl)
    }
    
    func setup(viewModel: CarouselCardViewModel, downloadCompletion: @escaping (UIImage?) -> ()) {
        imageView.kf.setImage(with: viewModel.imageUrl,
                              placeholder: nil,
                              options: [.transition(.fade(0.2)), .downloadPriority(viewModel.priority)])
        { (image, _, _, _) in
            downloadCompletion(image)
        }
        cardText.text = viewModel.text
    }
}
