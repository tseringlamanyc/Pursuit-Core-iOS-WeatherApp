//
//  FavCell.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class FavCell: UICollectionViewCell {
    
    public lazy var favPic: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        setUpImage()
    }
    
    private func setUpImage() {
        addSubview(favPic)
        favPic.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favPic.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            favPic.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            favPic.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            favPic.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40)
        ])
    }
    
    public func updateUI(photo: Things) {
        favPic.getImage(with: photo.largeImageURL) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let image):
                self?.favPic.image = image
            }
        }
    }
}
