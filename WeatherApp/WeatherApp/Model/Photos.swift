//
//  Photos.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Pixabay: Codable {
    let hits: [Things]
}

struct Things: Codable, Equatable {
    let largeImageURL: String
    let likes: Int
    let views: Int
    let pageURL: String
    let downloads: Int
    let tags: String?
}
