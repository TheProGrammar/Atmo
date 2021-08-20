//
//  Model.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import Foundation

struct WeatherModel: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
}
