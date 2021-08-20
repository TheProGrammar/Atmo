//
//  AtmoApp.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import SwiftUI

@main
struct AtmoApp: App {
    var body: some Scene {
        WindowGroup {
            AtmoView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
