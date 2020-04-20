//
//  MainPresenterTest.swift
//  MVP-TestTests
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import XCTest

@testable import MVP_Test

class MockView: MainViewProtocol {
    
    var textLabel: String?
    
    func setGreeting(greeting: String) {
        self.textLabel = greeting
    }
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainModulPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainModulPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModulIsNotNil() {
        XCTAssertNotNil(view, "View is not NIL")
        XCTAssertNotNil(person, "Person is not NIL")
        XCTAssertNotNil(presenter, "Presenter is not NIL")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.textLabel, "Welcome Baz Bar" , "Ok")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }


}
