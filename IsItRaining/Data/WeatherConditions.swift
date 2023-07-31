//
//  WeatherConditions.swift
//  IsItRaining
//
//  Created by ostojan on 31/07/2023.
//

import Foundation

struct WeatherConditions: Decodable {
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Int
    var humidity: Int

    private enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
