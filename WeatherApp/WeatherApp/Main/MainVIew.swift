//
//  MainVIew.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainVIew: UIView {
    
    public lazy var weatherLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "The weather forecast for New York"
        return label
    }()
    
    public lazy var weatherCV: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
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
        setupLabel()
        setupCV()
    }
    
    private func setupLabel() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            weatherLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    private func setupCV() {
        addSubview(weatherCV)
        weatherCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCV.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            weatherCV.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCV.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherCV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -350)
        ])
    }
}
