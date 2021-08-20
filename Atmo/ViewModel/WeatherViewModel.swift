//
//  WeatherViewModel.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var name: String = "--"
    @Published var temp: String = "__"
    
}
