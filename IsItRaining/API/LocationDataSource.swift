//
//  LocationDataSource.swift
//  IsItRaining
//
//  Created by ostojan on 04/08/2023.
//

import Foundation

class LocationDataSource {
    enum LocationDataSourceError: Error {
        case malformedURL
        case unsuccessfulConnection
        case malformedData
        case unknown
    }

    private let directAPIBaseAddress = Config.directGeocodingAPIBaseAddress

    func locationData(for query: String) async throws -> [LocationData] {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(directAPIBaseAddress)&q=\(query)&limit=5")
        else {
            throw LocationDataSourceError.malformedURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([LocationData].self, from: data)
        } catch is URLError {
            throw LocationDataSourceError.unsuccessfulConnection
        } catch is DecodingError {
            throw LocationDataSourceError.malformedData
        } catch {
            throw LocationDataSourceError.unknown
        }
    }
}
