//
//  WayWayViewController.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit
import Kingfisher

class WayViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Variables
    var output: WayViewOutput!
    
    var viewManager: WayViewManager!
    
    @IBOutlet var wayTableView: UITableView!
    
    @IBOutlet var firstBackgroundImageView: UIImageView!
    
    @IBOutlet var secondBackgroundImageView: UIImageView!
    
    @IBOutlet var shadowView: UIView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gl = CAGradientLayer()
        gl.colors = [UIColor.yourWayShadowGradientColor.cgColor, UIColor.clear.cgColor]
        gl.frame = shadowView.frame
        gl.startPoint = CGPoint(x: 1.0, y: 0.0)
        gl.endPoint = CGPoint(x: 1.0, y: 1.0)
        shadowView.layer.addSublayer(gl)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }

    // MARK: - Private
}

// MARK: - WayViewInput

extension WayViewController: WayViewInput {
    func setupInitialState() {
        wayTableView.dataSource = viewManager
        wayTableView.delegate = viewManager
        wayTableView.separatorStyle = .none
        wayTableView.tableFooterView = UIView()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
    }

    func setupStateForViewWillAppear() {
        
    }

    func setupStateForViewWillDisappear() {
    }
    
    func setup(viewModels: [WayStepViewModel], firstImagePath: URL, secondImagePath: URL) {
        viewManager.viewModels = viewModels
        let blur = BlurImageProcessor(blurRadius: WayConstants.Blur.radius)
        firstBackgroundImageView.kf.setImage(with: firstImagePath,
                                             placeholder: UIImage(named: "bg-placeholder")!,
                                             options: [.processor(blur)])
        print(firstImagePath)
        secondBackgroundImageView.kf.setImage(with: secondImagePath,
                                              placeholder: UIImage(named: "bg-placeholder")!,
                                              options: [.processor(blur)])
        print(secondImagePath)
        wayTableView.reloadData()
    }
    
    func updateBackground(reserveImageURL: URL) {
        
        let firstHideSecondShow: Bool = firstBackgroundImageView.alpha == 1
        
        let duration = WayConstants.AnimationTiming.fadeTime
        
        let blur = BlurImageProcessor(blurRadius: WayConstants.Blur.radius)
        
        
        if (firstHideSecondShow) {
            UIView.transition(with: firstBackgroundImageView, duration: duration, options: [.transitionCrossDissolve], animations: {
                self.firstBackgroundImageView.alpha = 0
            }, completion: { _ in
                self.firstBackgroundImageView.kf.setImage(with: reserveImageURL,
                                                          placeholder: UIImage(named: "bg-placeholder")!,
                                                          options: [.processor(blur)])
            })
            
            UIView.transition(with: secondBackgroundImageView, duration: duration, options: [.transitionCrossDissolve], animations: {
                self.secondBackgroundImageView.alpha = 1
            })
        } else {
            UIView.transition(with: secondBackgroundImageView, duration: duration, options: [.transitionCrossDissolve], animations: {
                self.secondBackgroundImageView.alpha = 0
            }, completion: { _ in
                self.secondBackgroundImageView.kf.setImage(with: reserveImageURL,
                                                           placeholder: UIImage(named: "bg-placeholder")!,
                                                           options: [.processor(blur)])
            })
            
            UIView.transition(with: firstBackgroundImageView, duration: duration, options: [.transitionCrossDissolve], animations: {
                self.firstBackgroundImageView.alpha = 1
            })
        }
        
    }
}
