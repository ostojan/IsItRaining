//
//  Config.swift
//  IsItRaining
//
//  Created by ostojan on 03/08/2023.
//

import Foundation

struct Config {
    private static func value(for key: String) -> String {
        guard let configFilePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            fatalError("Could not found config file")
        }
        guard let object = NSDictionary(contentsOfFile: configFilePath) as? [String: Any] else {
            fatalError("Could not load config file")
        }
        guard object.keys.contains(key) else {
            fatalError("Could not find key in config file")
        }
        guard let value = object[key] as? String else {
            fatalError("Could not load value from config file")
        }
        return value
    }

    private static let apiKey = Config.value(for: "APIKey")

    static var weatherAPIBaseAddress: String {
        return "https://api.openweathermap.org/data/2.5/weather?appid=\(Config.apiKey)"
    }

    static var directGeocodingAPIBaseAddress: String {
        "http://api.openweathermap.org/geo/1.0/direct?appid=\(Config.apiKey)"
    }

    static var reverseGeocodingAPIBaseAddress: String {
        "http://api.openweathermap.org/geo/1.0/reverse?appid=\(Config.apiKey)"
    }
}
