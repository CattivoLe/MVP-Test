//
//  RouterTest.swift
//  MVP-TestTests
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import XCTest
@testable import MVP_Test

class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigation = MockNavigationController()
    var assembly = ModelBuilder()

    override func setUpWithError() throws {
        router = Router(navigation: navigation, builder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigation.presentedVC
        XCTAssertTrue(detailVC is DetailViewController)
    }

}
