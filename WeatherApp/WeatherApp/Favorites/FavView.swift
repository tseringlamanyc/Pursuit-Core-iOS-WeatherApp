//
//  FavView.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavView: UIView {
    
    public lazy var favCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 400, height: 400)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemRed
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCV()
    }
    
    private func setupCV() {
        addSubview(favCV)
        favCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favCV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            favCV.leadingAnchor.constraint(equalTo: leadingAnchor),
            favCV.trailingAnchor.constraint(equalTo: trailingAnchor),
            favCV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
}
