//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    var aWeather: DailyData!
    
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
    
    public lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var highLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
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
        setUpDate()
        setupImage()
        setupHigh()
        setupLow()
    }
    
    func setupGradient() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor(red: (255/255.0), green: (185/255.0), blue: (0/255.0), alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [0,0]
    }

    private func setUpDate() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupImage() {
        addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            weatherIcon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            weatherIcon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            weatherIcon.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)
        ])
    }
    
    private func setupHigh() {
        addSubview(highLabel)
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 10),
            highLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            highLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupLow() {
        addSubview(lowLabel)
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowLabel.topAnchor.constraint(equalTo: highLabel.bottomAnchor, constant: 10),
            lowLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            lowLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    public func configureCell(weather: DailyData) {
        dateLabel.text = "\(weather.time.convertDate())"
        weatherIcon.image = UIImage(named: weather.icon)
        highLabel.text = "High: \(weather.temperatureHigh)"
        lowLabel.text = "Low: \(weather.temperatureLow)"
    }
    
}

extension Double {
    func convertDate() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    func convertTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
