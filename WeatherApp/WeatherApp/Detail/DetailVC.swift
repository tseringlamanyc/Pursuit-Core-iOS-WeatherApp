//
//  DetailVC.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    private var detailView = DetailView()
    
    override func loadView() {
        view = detailView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: nil)
        view.backgroundColor = .systemBackground
    }

}
