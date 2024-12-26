//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by Kenan on 19.12.24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarItems()
    }
    
private func createTabBarItems() {
    let homeViewController = UINavigationController(rootViewController: HomeVC(viewModel: HomeViewModel()))
    let UpComingVC = UINavigationController(rootViewController: UpComingVC())
    let searchVC = UINavigationController(rootViewController: SearchVC())
    let downloadVC = UINavigationController(rootViewController: DownloadVC())
    
    homeViewController.tabBarItem.image = UIImage(systemName: "house")
    UpComingVC.tabBarItem.image = UIImage(systemName: "play.circle")
    searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    downloadVC.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
    
    homeViewController.title = "Home"
    UpComingVC.title = "Upcoming"
    searchVC.title = "Search"
    downloadVC.title = "Download"
    
    setViewControllers([homeViewController, UpComingVC, searchVC, downloadVC] , animated: true)
    
    }

}

