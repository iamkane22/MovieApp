//
//  AuthViewController.swift
//  MovieApp
//
//  Created by Kenan on 08.01.25.
//

import UIKit

final class AuthCordinator: Coordinator {
        
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginViewController(viewModel: .init(navigation: self))
        navigationController.show(controller, sender: nil)
    }
}

extension AuthCordinator: AuthNavigation {
    func showLogin() {
        let controller = LoginViewController(viewModel: .init(navigation: self))
        navigationController.show(controller, sender: nil)
    }
    
    func showRegister() {
        let controller = RegisterViewController()
        navigationController.show(controller, sender: nil)    }
    
    
}
