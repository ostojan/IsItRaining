//
//  WeatherData.swift
//  IsItRaining
//
//  Created by ostojan on 31/07/2023.
//

import Foundation

struct WeatherData: Decodable {
    var info: [WeatherInfo]
    var conditions: WeatherConditions
    var visibility: Int
    var wind: WeatherWind
    
    private enum CodingKeys: String, CodingKey {
        case visibility, wind
        case info = "weather"
        case conditions = "main"
    }
}
