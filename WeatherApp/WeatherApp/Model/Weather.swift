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
    let data: [DailyData]
}

struct DailyData: Codable {
    let summary: String?
    let time: Double
    let icon: String
    let sunriseTime: Double
    let sunsetTime: Double
    let precipProbability: Double
    let precipType: String?
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
}
