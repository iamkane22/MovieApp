//
//  AppCordinator.swift
//  MovieApp
//
//  Created by Kenan on 21.12.24.
//

import UIKit

class AppCoordinator : Coordinator {
    var parentCoordinator: (any Coordinator)?
    var window: UIWindow?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    
    var isLogin: Bool = false
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        if isLogin {
            Home()
        } else {
            showAuth()
        }
    }
    
    private func setubTabBarController() {
        let tabBarController = MainTabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }
    
    func goToSearch() {
        let vc = SearchVC()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func Download() {
        let vc = DownloadVC()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func Upcoming() {
        let vc = UpComingVC()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func Home() {
        let vc = HomeVC(viewModel: HomeViewModel())
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
        
        
    fileprivate func showAuth() {
        children.removeAll()
        let authCoordinator = AuthCordinator(navigationController: navigationController)
        children.append(authCoordinator)
        authCoordinator.parentCoordinator = self
        authCoordinator.start()
    }
}
