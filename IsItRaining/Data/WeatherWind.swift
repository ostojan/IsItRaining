//
//  WeatherWind.swift
//  IsItRaining
//
//  Created by ostojan on 31/07/2023.
//

import Foundation

struct WeatherWind: Decodable {
    var speed: Double
    var degree: Int
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}
