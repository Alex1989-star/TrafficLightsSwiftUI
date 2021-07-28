//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Леся on 27.07.2021.
//

import SwiftUI

enum TrafficLightColor {
    case red, yellow, green
}

enum TrafficLightState: Double {
    case on = 1.0
    case off = 0.2
}

struct ContentView: View {
    @State private var started = false
    @State var currentLight: TrafficLightColor?
    
    private var signals: [TrafficLightColor] = [.red, .yellow, .green]
        
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Image("trafficLight").frame(width: 170, height: 170, alignment: .bottom)
            
            VStack {
                Spacer()
                
                ForEach(signals, id: \.self) { signalColor in
                    ColorSignal(color: signalColor, state: currentLight == signalColor ? .on : .off)
                }
                
                Spacer()
                
                VStack {
                    Button(action:  {
                        started = true
                        
                        switch currentLight {
                        case .red:
                            self.currentLight = .yellow
                        case .yellow:
                            self.currentLight = .green
                        case .green, .none:
                            self.currentLight = .red
                        }
                        
                    }, label: {
                        Text(started ? "Next" : "Start")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.all, 30)
                            .frame(width: 200)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 3))
                            .background(LinearGradient(gradient: Gradient(colors: [.white, .blue, .red]), startPoint: .top, endPoint: .bottom))
                    }).padding(.bottom, 100)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
