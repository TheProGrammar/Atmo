//
//  WeatherViewModel.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import Foundation

public class WeatherViewModel: ObservableObject {
    
    @Published var city: String = ""
    @Published var temp: String = ""
    @Published var description: String = ""
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.city = weather.city
                self.temp = "\(weather.temp)°C"
                self.description = weather.description.capitalized
            }
        }
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
}
