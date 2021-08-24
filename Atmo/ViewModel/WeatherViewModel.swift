//
//  WeatherViewModel.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import Foundation

public class WeatherViewModel: ObservableObject {
    
    @Published var city: String = "London"
    @Published var temp: String = "10°"
    @Published var description: String = "Broken Clouds"
    var weatherImage: String {
        switch description {
        case "Few Clouds": return "day_partial_cloud"
        case "Clear Sky": return "day_clear"
        case "Scattered Clouds": return "overcast"
        case "Broken Clouds": return "cloudy"
        case "Shower Rain": return "shower_rain"
        case "Rain": return "rain"
        case "Thunderstorm": return "rain_thunder"
        case "Snow": return "snow"
        case "Mist": return "mist"
        default:
            return "cloudy"
        }
    }
    
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
