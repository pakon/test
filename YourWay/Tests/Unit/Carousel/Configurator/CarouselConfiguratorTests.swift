//
//  CarouselCarouselConfiguratorTests.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import XCTest

class CarouselModuleConfiguratorTests: XCTestCase {

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
        let viewController = CarouselViewControllerMock()
        let configurator = CarouselModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "CarouselViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CarouselPresenter, "output is not CarouselPresenter")

        let presenter: CarouselPresenter = viewController.output as! CarouselPresenter
        XCTAssertNotNil(presenter.view, "view in CarouselPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CarouselPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CarouselRouter, "router is not CarouselRouter")

        let interactor: CarouselInteractor = presenter.interactor as! CarouselInteractor
        XCTAssertNotNil(interactor.output, "output in CarouselInteractor is nil after configuration")

        let router: CarouselRouter = presenter.router as! CarouselRouter
        XCTAssertTrue(router.transitionHandler is CarouselViewController, "transitionHandler is not CarouselViewController")
    }

    class CarouselViewControllerMock: CarouselViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
