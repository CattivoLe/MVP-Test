//
//  MainPresenterTest.swift
//  MVP-TestTests
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import XCTest
@testable import MVP_Test

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var presenter: MainModulPresenter!
    var network: NetworkServiceProtocol!
    var router: RouterProtocol!

    override func setUpWithError() throws {
        let nav = UINavigationController()
        let builder = ModelBuilder()
        router = Router(navigation: nav, builder: builder)
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        network = nil
        router = nil
    }
    
    func testGetSuccesComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        var catchComments: [Comment]?
        view = MockView()
        network = MockNetwork(comments: [comment])
        presenter = MainModulPresenter(view: view, networkService: network, router: router)
        
        network.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchComments?.count, 0)
    }
    
    func testGetFailureComments() {
        var catchError: Error?
        view = MockView()
        network = MockNetwork()
        presenter = MainModulPresenter(view: view, networkService: network, router: router)
        
        network.getComments { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                catchError = error
            }
        }
        XCTAssertNotNil(catchError)
    }

}
