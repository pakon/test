//
//  WayWayViewController.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class WayViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Variables
    var output: WayViewOutput!
    
    var viewManager: WayViewManager!
    
    @IBOutlet var wayTableView: UITableView!

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
    
    func setup(viewModels: [WayStepViewModel]) {
        viewManager.viewModels = viewModels
        wayTableView.reloadData()
    }
}
