//
//  ModulBuilder.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol BuilderProtocol {
    func createMainModul(router: RouterProtocol) -> UIViewController
    func createDetailModul(comment: Comment?, router: RouterProtocol) -> UIViewController
}

//MARK: - Class
class ModelBuilder: BuilderProtocol {
    
    // Main modul
    func createMainModul(router: RouterProtocol) -> UIViewController {
        let mainView = MainViewController()
        let networkService = NetworkService()
        let presenter = MainModulPresenter(view: mainView, networkService: networkService, router: router)
        
        mainView.presenter = presenter
        return mainView
    }
    
    // Detail modul
    func createDetailModul(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let detailView = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: detailView, networkService: networkService, router: router, comment: comment)
        
        detailView.presenter = presenter
        return detailView
    }
}
