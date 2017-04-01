//
//  OpportunityOpportunityViewController.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class OpportunityViewController: UIViewController {

    // MARK: - Outlets

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
}

// MARK: - OpportunityViewInput

extension OpportunityViewController: OpportunityViewInput {
    func setupInitialState() {
    }

    func setupStateForViewWillAppear() {
    }

    func setupStateForViewWillDisappear() {
    }
}
