//
//  ContentView.swift
//  IsItRaining
//
//  Created by ostojan on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    enum Section {
        case weather, location
    }

    @State private var selectedTab = Section.weather
    @State private var locationData: LocationData?
    @State private var weatherData: WeatherData?

    var body: some View {
        TabView(selection: $selectedTab) {
            CurrentWeatherView(location: locationData)
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun")
                }
                .tag(Section.weather)

            LocationSearchView { newLocationData in
                locationData = newLocationData
                selectedTab = .weather
            }
            .tabItem {
                Label("Location", systemImage: "location")
            }
            .tag(Section.location)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
