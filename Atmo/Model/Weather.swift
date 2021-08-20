//
//  Model.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import Foundation

public struct Weather {
    let city: String
    let temp: String
    let description: String
    
    init(response: APIResponse) {
        city = response.name
        temp = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
    }
}
