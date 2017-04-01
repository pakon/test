//
//  OpportunityOpportunityViewController.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit
import Kingfisher

class OpportunityViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Variables
    var output: OpportunityViewOutput!

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
    fileprivate func setupNavigationBar() {
        setBlurNavigationBar()
        
        let leftBarImage = UIImage(named:"back-icon")
        let leftBarItem = UIBarButtonItem(image: leftBarImage, style: .plain, target: navigationController!, action: #selector(UINavigationController.popViewController(animated:)))
        leftBarItem.tintColor = UIColor.white
        navigationItem.setLeftBarButton(leftBarItem, animated: false)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
}

// MARK: - OpportunityViewInput

extension OpportunityViewController: OpportunityViewInput {
    func setupInitialState() {
        setupNavigationBar()
    }

    func setupStateForViewWillAppear() {
    }

    func setupStateForViewWillDisappear() {
    }
    
    func setup(viewModel: OpportunityViewModel) {
        if let backgroundImage = viewModel.backgroundImage {
            self.backgroundImage.image = backgroundImage.blurred(radius: 10)
        } else {
            ImageDownloader.default.downloadImage(with: viewModel.backgroundUrl, options: [], progressBlock: nil) {
                (image, _, _, _) in
                self.backgroundImage.image = image?.blurred(radius: 10)
            }
        }
    
        iconImage.image = viewModel.iconImage
        titleLabel.text = viewModel.title
        navigationItem.title = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
