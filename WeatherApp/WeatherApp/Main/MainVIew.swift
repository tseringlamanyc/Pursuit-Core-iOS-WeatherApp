//
//  MainVIew.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    public lazy var animate: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-0.5, -0.25, 0]
        animation.toValue = [1.0, 1.25, 1.5]
        animation.duration = 5.0
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        self.gradient.add(animation, forKey: nil)
        return animation
    }()
    
    public lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome"
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
        textfield.backgroundColor = .systemGray3
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
        setupGradient()
        self.layer.add(animate, forKey: nil)
        self.layer.addSublayer(gradient)
        animateThem()
        setupLabel()
        setupCV()
        setupTextField()
        setUpZip()
    }
    
    func setupGradient() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor(red: (255/255.0), green: (185/255.0), blue: (0/255.0), alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [0,0]
    }

    
    private func setupLabel() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            weatherLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
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
            enterLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            enterLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            enterLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    private func animateThem() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.weatherLabel.transform = CGAffineTransform(translationX: 50, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseIn], animations: {
            self.enterLabel.transform = CGAffineTransform(translationX: 0, y: -35)
        }, completion: nil)
    }
    
}
