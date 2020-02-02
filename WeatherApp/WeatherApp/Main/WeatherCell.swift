//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    public lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "feb"
        return label
    }()
    
    public lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudy")
        return imageView
    }()
    
    public lazy var highLabel: UILabel = {
        let label = UILabel()
        label.text = "high"
        return label
    }()
    
    public lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.text = "low"
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
           
       }
    
    
    
}
