//
//  DetailView.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "The weather forecast for New York for feb"
        return label
    }()
    
    public lazy var cityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudy")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Partly cloudy"
        return label
    }()
    
    public lazy var highLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "high"
        return label
    }()

    public lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Low"
        return label
    }()
    
    public lazy var sunrise: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sunrise"
        return label
    }()

    public lazy var sunset: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sunset"
        return label
    }()
    
    public lazy var windSpeed: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Windspeed"
        return label
    }()
    
    public lazy var precipitation: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Precipitation"
        return label
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
        setupImage()
    }
    
    private func setupLabel() {
        addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            topLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupImage() {
        addSubview(cityImage)
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            cityImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cityImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20),
            cityImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40)
        ])
    }
    
    
    
}
