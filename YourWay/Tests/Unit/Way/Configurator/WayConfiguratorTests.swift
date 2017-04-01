//
//  WayWayConfiguratorTests.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import XCTest

class WayModuleConfiguratorTests: XCTestCase {

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
        let viewController = WayViewControllerMock()
        let configurator = WayModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "WayViewController is nil after configuration")
        XCTAssertTrue(viewController.output is WayPresenter, "output is not WayPresenter")

        let presenter: WayPresenter = viewController.output as! WayPresenter
        XCTAssertNotNil(presenter.view, "view in WayPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in WayPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is WayRouter, "router is not WayRouter")

        let interactor: WayInteractor = presenter.interactor as! WayInteractor
        XCTAssertNotNil(interactor.output, "output in WayInteractor is nil after configuration")

        let router: WayRouter = presenter.router as! WayRouter
        XCTAssertTrue(router.transitionHandler is WayViewController, "transitionHandler is not WayViewController")
    }

    class WayViewControllerMock: WayViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
