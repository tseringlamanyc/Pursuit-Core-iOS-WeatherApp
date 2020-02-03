//
//  MainVC.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    private var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    var allWeather = [DailyData]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.weatherCV.reloadData()
            }
        }
    }
    
    var theZipcode = "" {
        didSet {
            getZip(string: theZipcode)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBarController?.navigationItem.title = "Search"
        mainView.weatherCV.register(WeatherCell.self, forCellWithReuseIdentifier: "weatherCell")
        mainView.weatherCV.dataSource = self
        mainView.weatherCV.delegate = self
        mainView.textField.delegate = self
    }
    
    private func getWeather(lat: Double, long: Double, placename: String) {
        WeatherAPI.getLatLong(lat: lat, long: long) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let weatherData):
                self.allWeather = weatherData.daily.data
            }
        }
    }
    
    private func getZip(string: String) {
        ZipCodeHelper.getLatLong(fromZipCode: string) { (result) in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let coordinates):
                self.getWeather(lat: coordinates.lat, long: coordinates.long, placename: coordinates.placeName)
            }
        }
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError()
        }
        let oneWeather = allWeather[indexPath.row]
        cell.configureCell(weather: oneWeather)
        return cell
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.48
        return CGSize(width: itemWidth, height: 264)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MainVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        theZipcode = textField.text!
        textField.resignFirstResponder()
        return true 
    }
}
