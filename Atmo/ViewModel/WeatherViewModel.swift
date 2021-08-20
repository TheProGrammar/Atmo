//
//  WeatherViewModel.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var temp: String = ""
    
    init() {
        performRequest()
    }
    
    func performRequest() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=d235471cc10b9febda95dead98d2fc1b&units=metric") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.name = model.name
                    self.temp = "\(model.main.temp)°C"
                }
            }
            catch {
                print("Something went wrong: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
