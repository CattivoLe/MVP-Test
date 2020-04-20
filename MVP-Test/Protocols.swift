//
//  Protocols.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

//MARK: - MAin View

protocol MainViewProtocol: class { // For ViewController
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class { // For Presenter
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}

protocol Builder {
    static func createMainModul() -> UIViewController
    static func createDetailModul(comment: Comment?) -> UIViewController
}

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

//MARK: - Detail View

protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init (view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}
