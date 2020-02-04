//
//  DetailView.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class DetailView: UIView {
    
    var photo1: Things!
    
    public lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
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
    
    public lazy var sunrise: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var sunset: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var windSpeed: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var precipitation: UILabel = {
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
        setupLabel()
        setupImage()
        setupCondition()
        setupHigh()
        setupLow()
        setupSunrise()
        setupSunset()
        setupWind()
        setupPre()
    }
    
    private func setupLabel() {
        addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            topLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupImage() {
        addSubview(cityImage)
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            cityImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            cityImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            cityImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40)
        ])
    }
    
    private func setupCondition() {
        addSubview(conditionLabel)
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: cityImage.bottomAnchor, constant: 5),
            conditionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            conditionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupHigh() {
        addSubview(highLabel)
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highLabel.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 25),
            highLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            highLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupLow() {
        addSubview(lowLabel)
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowLabel.topAnchor.constraint(equalTo: highLabel.bottomAnchor, constant: 25),
            lowLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lowLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupSunrise() {
        addSubview(sunrise)
        sunrise.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunrise.topAnchor.constraint(equalTo: lowLabel.bottomAnchor, constant: 25),
            sunrise.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            sunrise.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupSunset() {
        addSubview(sunset)
        sunset.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunset.topAnchor.constraint(equalTo: sunrise.bottomAnchor, constant: 25),
            sunset.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            sunset.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupWind() {
        addSubview(windSpeed)
        windSpeed.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windSpeed.topAnchor.constraint(equalTo: sunset.bottomAnchor, constant: 25),
            windSpeed.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            windSpeed.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupPre() {
        addSubview(precipitation)
        precipitation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            precipitation.topAnchor.constraint(equalTo: windSpeed.bottomAnchor, constant: 25),
            precipitation.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            precipitation.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func updateUI(weather: DailyData) {
        topLabel.text = "\(weather.time.convertDate())"
        conditionLabel.text = weather.summary ?? "n/a"
        highLabel.text = "High: \(weather.temperatureHigh.description)"
        lowLabel.text = "Low: \(weather.temperatureLow.description)"
        windSpeed.text = "Windspeed: \(weather.windSpeed.description)"
        sunrise.text = "Sunrise: \(weather.sunriseTime.convertTime())"
        sunset.text = "Sunset: \(weather.sunsetTime.convertTime())"
        precipitation.text = "Precipitation: \(weather.precipProbability.description)"
    }
    
}

