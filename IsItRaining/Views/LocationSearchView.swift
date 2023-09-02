//
//  LocationSearchView.swift
//  IsItRaining
//
//  Created by ostojan on 22/08/2023.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var locationText = ""
    @State private var locations = [LocationData]()
    let onLocationSelect: (LocationData) -> Void

    var body: some View {
        List {
            Section {
                TextField("City", text: $locationText)
                    .onSubmit {
                        Task {
                            await searchForLocation()
                        }
                    }
            }

            Section {
                if locations.isEmpty {
                    Text("No location found")
                } else {
                    ForEach(locations) { location in
                        Button {
                            onLocationSelect(location)
                        } label: {
                            LocationListCell(for: location)
                        }
                    }
                }
            }
        }
    }

    @MainActor
    func searchForLocation() async {
        do {
            locations = try await LocationDataSource().locationData(for: locationText)
        } catch {}
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(onLocationSelect: { _ in })
    }
}
