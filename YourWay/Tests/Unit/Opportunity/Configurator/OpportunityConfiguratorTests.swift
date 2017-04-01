//
//  OpportunityOpportunityConfiguratorTests.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import XCTest

class OpportunityModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = OpportunityViewControllerMock()
        let configurator = OpportunityModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "OpportunityViewController is nil after configuration")
        XCTAssertTrue(viewController.output is OpportunityPresenter, "output is not OpportunityPresenter")

        let presenter: OpportunityPresenter = viewController.output as! OpportunityPresenter
        XCTAssertNotNil(presenter.view, "view in OpportunityPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in OpportunityPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is OpportunityRouter, "router is not OpportunityRouter")

        let interactor: OpportunityInteractor = presenter.interactor as! OpportunityInteractor
        XCTAssertNotNil(interactor.output, "output in OpportunityInteractor is nil after configuration")

        let router: OpportunityRouter = presenter.router as! OpportunityRouter
        XCTAssertTrue(router.transitionHandler is OpportunityViewController, "transitionHandler is not OpportunityViewController")
    }

    class OpportunityViewControllerMock: OpportunityViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
