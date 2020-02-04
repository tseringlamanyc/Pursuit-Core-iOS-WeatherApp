//
//  DetailVC.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    public var detailView = DetailView()
    
     public var photo: Things?
    
    public var dataPersistence: PersistenceHelper!
    
    override func loadView() {
        view = detailView
        photo = detailView.photo1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(saveToFave(sender:)))
        view.backgroundColor = .systemBackground
    }
    
    @objc
    private func saveToFave(sender: UIBarButtonItem) {
        
        guard let photo = photo else {
            fatalError("no photo")
        }
        
        do {
            try dataPersistence.save(photo: photo)
            showAlert(title: "Success", message: "Photo saved")
        } catch {
            showAlert(title: "Failed", message: "Couldnt save photo")
        }
    }
   
}
