//
//  WeatherDataViewModel.swift
//  IsItRaining
//
//  Created by ostojan on 15/08/2023.
//

import Foundation

struct WeatherDataViewModel {
    private let weatherData: WeatherData
    private let measurementFormatter: MeasurementFormatter
    private let percentageFormatter: NumberFormatter

    init(for weatherData: WeatherData) {
        self.weatherData = weatherData
        self.measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = Locale.autoupdatingCurrent
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        self.percentageFormatter = NumberFormatter()
        percentageFormatter.numberStyle = .percent
        percentageFormatter.maximumFractionDigits = 0
    }

    var condition: String {
        guard let info = weatherData.info.first else {
            return "Unknown"
        }
        return info.name
    }

    var weatherIcon: String {
        guard let info = weatherData.info.first else {
            return "cloud"
        }
        switch info.icon {
            case "01d":
                return "sun.max.fill"
            case "01n":
                return "moon.fill"
            case "02d":
                return "cloud.moon.fill"
            case "02n":
                return "cloud.sun.fill"
            case "03d":
                fallthrough
            case "03n":
                fallthrough
            case "04d":
                fallthrough
            case "04n":
                return "cloud.fill"
            case "09d":
                fallthrough
            case "09n":
                return "cloud.rain.fill"
            case "10d":
                return "cloud.sun.rain.fill"
            case "10n":
                return "cloud.moon.rain.fill"
            case "11d":
                fallthrough
            case "11n":
                return "cloud.bolt.fill"
            case "13d":
                fallthrough
            case "13n":
                return "cloud.snow.fill"
            case "50d":
                return "sun.haze.fill"
            case "50n":
                return "moon.haze.fill"
            default:
                return "cloud.fill"
        }
    }

    var currentTemperature: String {
        measurementFormatter.string(from: Measurement(value: weatherData.conditions.temp, unit: UnitTemperature.kelvin))
    }

    var feelsLikeTemperature: String {
        measurementFormatter.string(from: Measurement(value: weatherData.conditions.feelsLike, unit: UnitTemperature.kelvin))
    }

    var maximumTemperature: String {
        measurementFormatter.string(from: Measurement(value: weatherData.conditions.tempMax, unit: UnitTemperature.kelvin))
    }

    var minimumTemperature: String {
        measurementFormatter.string(from: Measurement(value: weatherData.conditions.tempMin, unit: UnitTemperature.kelvin))
    }

    var pressure: String {
        measurementFormatter.string(from: Measurement(value: Double(weatherData.conditions.pressure), unit: UnitPressure.hectopascals))
    }

    var humidity: String {
        percentageFormatter.string(from: (Double(weatherData.conditions.humidity) / 100.0) as NSNumber) ?? "Unknown"
    }

    var visibility: String {
        measurementFormatter.string(from: Measurement(value: Double(weatherData.visibility), unit: UnitLength.meters))
    }

    var windSpeed: String {
        measurementFormatter.string(from: Measurement(value: weatherData.wind.speed, unit: UnitSpeed.metersPerSecond))
    }

    var windDirection: String {
        let windDirection = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        let index = Int((Double(weatherData.wind.degree) + 22.5) / 45.0) % 8
        return windDirection[index]
    }
}
