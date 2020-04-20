//
//  ModulBuilder.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

class ModelBuilder: Builder {
    
    //MARK: - Main modul
    
    static func createMainModul() -> UIViewController {
        
        let viewController = MainViewController()
        let networkService = NetworkService()
        let presenter = MainModulPresenter(view: viewController, networkService: networkService)
        
        viewController.presenter = presenter
        return viewController
    }
    
    //MARK: - Detail modul
    
    static func createDetailModul(comment: Comment?) -> UIViewController {
        let detailView = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: detailView, networkService: networkService, comment: comment)
        
        detailView.presenter = presenter
        return detailView
    }
}
