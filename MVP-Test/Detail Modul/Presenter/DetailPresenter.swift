//
//  DetailPresenter.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import Foundation

//MARK: - Protocol
protocol DetailViewPresenterProtocol: class {
    init (view: DetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, comment: Comment?)
    func setComment()
    func tapped()
}

//MARK: - Class
class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.comment = comment
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    func tapped() {
        router?.popToRootVC()
    }
}
