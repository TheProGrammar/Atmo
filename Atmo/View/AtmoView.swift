//
//  ContentView.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import SwiftUI

struct AtmoView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.name)
                Text(viewModel.temp)
            }
            .navigationTitle("Atmo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AtmoView()
            
    }
}
