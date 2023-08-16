//
//  WeatherDetails.swift
//  IsItRaining
//
//  Created by ostojan on 16/08/2023.
//

import SwiftUI

struct WeatherDetails: View {
    private let viewModel: WeatherDataViewModel

    init(for weatherData: WeatherData) {
        self.viewModel = WeatherDataViewModel(for: weatherData)
    }

    var body: some View {
        VStack {
            Image(systemName: viewModel.weatherIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text(viewModel.currentTemperature)
                .font(.largeTitle)
            Text(viewModel.condition)
                .font(.headline)
            HStack {
                Text("H: \(viewModel.maximumTemperature)")
                Text("L: \(viewModel.minimumTemperature)")
            }
            Text("Feels like: \(viewModel.feelsLikeTemperature)")
            Text("Humidity: \(viewModel.humidity)")
            Text("Wind blows \(viewModel.windSpeed) from \(viewModel.windDirection)")
        }
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetails(for: .preview)
    }
}
