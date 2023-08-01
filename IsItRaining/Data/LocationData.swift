//
//  LocationData.swift
//  IsItRaining
//
//  Created by ostojan on 01/08/2023.
//

import Foundation

struct LocationData: Decodable {
    var name: String
    var localNames: [String: String] = [:]
    var latitude: Double
    var longitude: Double
    var country: String
    var state: String? = nil

    private enum CodingKeys: String, CodingKey {
        case name, country, state
        case localNames = "local_names"
        case latitude = "lat"
        case longitude = "lon"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        if let localNames = try container.decodeIfPresent([String: String].self, forKey: .localNames) {
            self.localNames = localNames
        }
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.country = try container.decode(String.self, forKey: .country)
        if let state = try container.decodeIfPresent(String.self, forKey: .state) {
            self.state = state
        }
    }
}
