//
//  Weather.swift
//  WeatherApp
//
//  Created by Tsering Lama on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let daily: Daily
}

struct Currently: Codable {
    let summary: String
    let icon: String
}

struct Daily: Codable {
    let data: DailyData
}

struct DailyData: Codable {
    let sunriseTime, sunsetTime: Int
    let windSpeed: Double
    let precipProbability: Double
}
