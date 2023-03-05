//
//  ViewController.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 11/02/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let hvc = UINavigationController(rootViewController: HomeViewController())
        let ucv = UINavigationController(rootViewController: UpComingViewController())
        let svc = UINavigationController(rootViewController: SearchViewController())
        let dvc = UINavigationController(rootViewController: DownloadViewController())
        
        hvc.tabBarItem.image = UIImage(systemName: "house")
        ucv.tabBarItem.image = UIImage(systemName: "play.circle")
        svc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        dvc.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        hvc.title = "Home"
        ucv.title = "Coming Soon"
        svc.title = "Top Search"
        dvc.title = "Downloads"
        
        // Tab bar color button
        tabBar.tintColor = .label
        
        setViewControllers([hvc, ucv, svc, dvc], animated: true)
    }


}

