//
//  MainVIew.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "The weather forecast for New York"
        return label
    }()
    
    public lazy var weatherCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 400, height: 400)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    public lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .systemGray
        textfield.keyboardType = .numbersAndPunctuation
        return textfield
    }()
    
    public lazy var enterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter a zipcode above"
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
        setupCV()
        setupTextField()
        setUpZip()
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
            weatherCV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -400)
        ])
    }
    
    private func setupTextField() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: weatherCV.bottomAnchor, constant: 25),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -150)
        ])
    }
    
    private func setUpZip() {
        addSubview(enterLabel)
        enterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            enterLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            enterLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}
