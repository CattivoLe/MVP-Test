//
//  MainModulPresenter.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var comments: [Comment]? { get set }
    func getComments()
    func tapOnTheComment(comment: Comment?)
}

//MARK: - Class
class MainModulPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var router: RouterProtocol?
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
}
