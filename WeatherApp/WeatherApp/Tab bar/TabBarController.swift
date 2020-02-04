//
//  TabBarController.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let dataPersistence = PersistenceHelper(filename: "fav.plist")
    
    private lazy var mainVC: MainVC = {
        let vc = MainVC()
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        vc.navigationItem.title = "Search"
        return vc
    }()
    
    private lazy var favVC: FavVC = {
        let vc = FavVC()
        vc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        vc.navigationItem.title = "Favorites"
        return vc
    }()
    
    let detailVC = DetailVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainVC.dataPersistence = dataPersistence
        detailVC.dataPersistence = dataPersistence
        favVC.dataPersistence = dataPersistence
        viewControllers = [mainVC,favVC]
    }
}
