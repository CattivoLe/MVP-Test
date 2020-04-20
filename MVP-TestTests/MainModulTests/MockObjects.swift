//
//  MockObjects.swift
//  MVP-TestTests
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit
@testable import MVP_Test

//MARK: - Main View
class MockView: MainViewProtocol {
    func succes() {
    }
    
    func failure(error: Error) {
    }
}

//MARK: - Network
class MockNetwork: NetworkServiceProtocol {
    var comments: [Comment]!
    
    init(){}
    
    convenience init (comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
}

//MARK: - Navigation
class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
