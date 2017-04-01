//
//  WayWayPresenterTests.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import XCTest

class WayPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: WayInteractorInput {

    }

    class MockRouter: WayRouterInput {

    }

    class MockViewController: WayViewInput {

        func setupInitialState() {

        }
    }
}
