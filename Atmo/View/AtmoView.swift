//
//  ContentView.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import SwiftUI

struct AtmoView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.city)
                Text(viewModel.temp)
                Text(viewModel.description)
            }
            .navigationTitle("Atmo")
        }
        .onAppear() {
            viewModel.refresh()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AtmoView(viewModel: WeatherViewModel(weatherService: WeatherService())) 
    }
}
