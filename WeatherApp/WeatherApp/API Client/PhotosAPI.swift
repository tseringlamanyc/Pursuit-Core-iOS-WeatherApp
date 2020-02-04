//
//  PhotosAPI.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct PhotoAPI {
    static func getPhotos(search: String, completionHandler: @escaping (Result<[Things], AppError>) -> ()) {
        
      let searchQuery = search.lowercased().addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "Trees"
    
        let endpointUrl = "https://pixabay.com/api/?key=14930089-06e7e4452105b9da33a54f058&q=\(searchQuery)"
        guard let url = URL(string: endpointUrl) else {
            completionHandler(.failure(.badURL(endpointUrl)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let photoData = try JSONDecoder().decode(Pixabay.self, from: data)
                    completionHandler(.success(photoData.hits))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
