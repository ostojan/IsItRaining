//
//  LocationDataViewModel.swift
//  IsItRaining
//
//  Created by ostojan on 17/08/2023.
//

import Foundation

struct LocationDataViewModel {
    private let locationData: LocationData
    private let coordinateFormatter: CoordinateFormatter

    init(for locationData: LocationData) {
        self.locationData = locationData
        self.coordinateFormatter = CoordinateFormatter()
    }

    var name: String {
        locationData.localNames[(Locale.current.language.region?.identifier ?? Locale.current.identifier).lowercased()] ?? locationData.name
    }

    var country: String {
        let country = Locale.current.localizedString(forRegionCode: locationData.country) ?? locationData.country
        if let state = locationData.state {
            return "\(country), \(state)"
        }
        return "\(country)"
    }

    var latitude: String {
        coordinateFormatter.string(from: Coordinate(value: locationData.latitude, type: .latitude))
    }

    var longitude: String {
        coordinateFormatter.string(from: Coordinate(value: locationData.longitude, type: .longitude))
    }
}
