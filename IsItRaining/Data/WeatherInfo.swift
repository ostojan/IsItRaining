//
//  WeatherInfo.swift
//  IsItRaining
//
//  Created by ostojan on 31/07/2023.
//

import Foundation

struct WeatherInfo: Decodable {
    var id: Int
    var name: String
    var description: String
    var icon: String
    
    private enum CodingKeys: String, CodingKey {
        case id, description, icon
        case name = "main"
    }
}
