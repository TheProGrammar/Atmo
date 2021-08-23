//
//  ContentView.swift
//  Atmo
//
//  Created by Miroslav Mali on 20.8.21..
//

import SwiftUI

struct AtmoView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        
        ZStack {
            
            Home(viewModel: viewModel)
            
            ZStack {
                
                Color("blue")
                
                Image("clipart")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                
                    // Scaling View...
                    .scaleEffect(animate ? 3 : 1)
                    // setting width to avoid over size...
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            // hiding view after finishing...
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            withAnimation(Animation.easeOut(duration: 1)) {
                
                animate.toggle()
                
            }
            
            withAnimation(Animation.easeOut(duration: 1)) {
                
                endSplash.toggle()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AtmoView(viewModel: WeatherViewModel(weatherService: WeatherService())) 
    }
}

struct Home : View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        VStack {

            Text(viewModel.city)
            Text(viewModel.temp)
            Text(viewModel.description)
            Image(viewModel.weatherImage)
                .resizable()
                .frame(width: 100, height: 100)
        }
        .onAppear() {
            viewModel.refresh()
        }
        
    }
}


