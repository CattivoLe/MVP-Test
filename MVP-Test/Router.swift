//
//  Router.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: BuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRootVC()
}

//MARK: - Class
class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderProtocol?
    
    init(navigation: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigation
        self.assemblyBuilder = builder
    }
    
    func initialViewController() {
        if let navigationVC = navigationController {
            guard let mainVC = assemblyBuilder?.createMainModul(router: self) else { return }
            navigationVC.viewControllers = [mainVC]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationVC = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModul(comment: comment, router: self) else { return }
            navigationVC.pushViewController(detailVC, animated: true)
        }
    }
    
    func popToRootVC() {
        if let navigationVC = navigationController {
            navigationVC.popToRootViewController(animated: true)
        }
    }
}
