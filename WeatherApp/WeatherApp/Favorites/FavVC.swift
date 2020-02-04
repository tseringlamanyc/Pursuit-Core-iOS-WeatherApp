//
//  FavVC.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavVC: UIViewController {
    
    public var favView = FavView()
    
    override func loadView() {
        view = favView
    }
    
    public var favorites = [Things]() {
        didSet {
            DispatchQueue.main.async {
                self.favView.favCV.reloadData()
            }
        }
    }
    
    public var dataPersistence: PersistenceHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        favView.favCV.register(FavCell.self, forCellWithReuseIdentifier: "favCell")
        favView.favCV.dataSource = self
        favView.favCV.delegate = self
        tabBarController?.navigationItem.title = "Favorites"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadFav()
    }
    
    func loadFav() {
        do {
            favorites = try dataPersistence.loadPhotos()
        } catch {
            print("no favoties")
        }
    }
}

extension FavVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as? FavCell else {
            fatalError()
        }
        let aFav = favorites[indexPath.row]
        cell.updateUI(photo: aFav)
        cell.backgroundColor = .systemBackground
        return cell 
    }
}

extension FavVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width 
        return CGSize(width: itemWidth, height: 264)
    }
}
