//
//  LocationDetails.swift
//  IsItRaining
//
//  Created by ostojan on 17/08/2023.
//

import SwiftUI

struct LocationDetails: View {
    private let viewModel: LocationDataViewModel

    init(for locationData: LocationData) {
        self.viewModel = LocationDataViewModel(for: locationData)
    }

    var body: some View {
        VStack {
            Text(viewModel.name)
                .font(.title)
            Text(viewModel.country)
                .font(.caption)
            HStack {
                Text(viewModel.latitude)
                Text(viewModel.longitude)
            }
            .font(.caption2)
        }
    }
}

struct LocationDetails_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetails(for: .preview)
    }
}
