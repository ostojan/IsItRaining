//
//  LocationListCell.swift
//  IsItRaining
//
//  Created by ostojan on 22/08/2023.
//

import MapKit
import SwiftUI

struct LocationListCell: View {
    private let viewModel: LocationDataViewModel

    init(for locationData: LocationData) {
        self.viewModel = LocationDataViewModel(for: locationData)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                Text(viewModel.country)
                    .font(.caption)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(viewModel.latitude)
                    .frame(width: .infinity)
                Text(viewModel.longitude)
                    .frame(width: .infinity)
            }
            .multilineTextAlignment(.leading)
            .font(.caption)
        }
    }
}

struct LocationListCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            LocationListCell(for: .preview)
        }
    }
}
