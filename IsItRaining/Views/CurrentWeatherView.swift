//
//  CurrentWeatherView.swift
//  IsItRaining
//
//  Created by ostojan on 02/09/2023.
//

import SwiftUI

struct CurrentWeatherView: View {
    let location: LocationData?
    @State private var weather: WeatherData?

    var body: some View {
        VStack {
            if location == nil {
                Text("Select location first")
            } else if weather == nil {
                ProgressView()
            } else if let location = self.location, let weather = self.weather {
                LocationDetails(for: location)
                WeatherDetails(for: weather)
            }
        }
        .onAppear {
            if location != nil {
                Task {
                    await getCurrentWeather()
                }
            }
        }
    }

    @MainActor
    func getCurrentWeather() async {
        guard let location = location else {
            return
        }
        do {
            weather = try await WeatherDataSource().weatherData(for: location)
        } catch {}
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(location: nil)
    }
}
