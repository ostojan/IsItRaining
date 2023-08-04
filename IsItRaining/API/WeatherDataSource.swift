//
//  WeatherDataSource.swift
//  IsItRaining
//
//  Created by ostojan on 04/08/2023.
//

import Foundation

class WeatherDataSource {
    enum WeatherDataSourceError: Error {
        case malformedURL
        case unsuccessfulConnection
        case malformedData
        case unknown
    }

    private let apiBaseAddress = Config.weatherAPIBaseAddress

    func weatherData(for location: LocationData) async throws -> WeatherData {
        guard let url = URL(string: "\(apiBaseAddress)&lat=\(location.latitude)&lon=\(location.longitude)") else {
            throw WeatherDataSourceError.malformedURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(WeatherData.self, from: data)
        } catch is URLError {
            throw WeatherDataSourceError.unsuccessfulConnection
        } catch is DecodingError {
            throw WeatherDataSourceError.malformedData
        } catch {
            throw WeatherDataSourceError.unknown
        }
    }
}
