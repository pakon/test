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

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
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
        firstBackgroundImageView.kf.setImage(with: firstImagePath, placeholder: UIImage(named: "bg-placeholder")!)
        print(firstImagePath)
        secondBackgroundImageView.kf.setImage(with: secondImagePath, placeholder: UIImage(named: "bg-placeholder")!)
        print(secondImagePath)
        wayTableView.reloadData()
    }
    
    func updateBackgroundColor() {
        
//        if firstBackgroundImageView.image != bottomImage {
//            if firstBackgroundImageView.image == nil {
//                print("устанавливаю картинку 1 через транзишион")
//                UIView.transition(with: firstBackgroundImageView, duration: 0.2, options: [.transitionCrossDissolve], animations: {
//                    self.firstBackgroundImageView.image = bottomImage
//                })
//            } else {
//                print("устанавливаю картинку 1")
//                firstBackgroundImageView.image = bottomImage
//            }
//        }
//        if secondBackgroundImageView.image != topImage {
//            if secondBackgroundImageView.image == nil {
//                print("устанавливаю картинку 2 через транзишион")
//                UIView.transition(with: secondBackgroundImageView, duration: 0.2, options: [.transitionCrossDissolve], animations: {
//                    self.secondBackgroundImageView.image = bottomImage
//                })
//            } else {
//                print("устанавливаю картинку 2")
//                secondBackgroundImageView.image = topImage
//            }
//        }
    }
}
