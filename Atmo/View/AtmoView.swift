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
    @State var splashHasEnded = false
    
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
            .opacity(splashHasEnded ? 0 : 1)
        }
    }
    
    func animateSplash() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            withAnimation(Animation.easeOut(duration: 1)) {
                
                animate.toggle()
                
            }
            
            withAnimation(Animation.easeOut(duration: 1)) {
                
                splashHasEnded.toggle()
                
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
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("blueDark"), Color("blueLight")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(Date(), style: .date)
                    .font(.system(size: 23, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .kerning(0)
                    .offset(y: -140)
                    .shadow(color: Color(#colorLiteral(red: 0.2037252307, green: 0.4193340443, blue: 0.5, alpha: 1)), radius: 3, x: 3, y: 3)
                Text(Date(), style: .time)
                    .font(.system(size: 35, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .kerning(0)
                    .offset(y: -130)
                    .shadow(color: Color(#colorLiteral(red: 0.2037252307, green: 0.4193340443, blue: 0.5, alpha: 1)), radius: 4, x: 3, y: 3)
                Text(viewModel.city)
                    .font(.system(size: 25, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .offset(y: -120)
                    .shadow(color: Color(#colorLiteral(red: 0.2037252307, green: 0.4193340443, blue: 0.5, alpha: 1)), radius: 4, x: 3, y: 3)
                Image(viewModel.weatherImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(y: -40)
                    .brightness(1)
                    .shadow(color: Color(#colorLiteral(red: 0.2037252307, green: 0.4193340443, blue: 0.5, alpha: 1)), radius: 2, x: 3, y: 3)
                Text(viewModel.temp)
                    .font(.system(size: 70, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .kerning(0)
                    .offset(y: -50)
                    .shadow(color: Color(#colorLiteral(red: 0.2037252307, green: 0.4193340443, blue: 0.5, alpha: 1)), radius: 2, x: 3, y: 3)
                Text(viewModel.description)
                    .font(.system(size: 25, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .kerning(0)
                    .offset(y: -40)
                    .shadow(color: Color(#colorLiteral(red: 0.2037252307, green: 0.4193340443, blue: 0.5, alpha: 1)), radius: 4, x: 3, y: 3)
                
            }
            .padding(200)
            .onAppear() {
                viewModel.refresh()
            }
        }
    }
}
