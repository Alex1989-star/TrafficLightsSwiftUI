//
//  ColorSignal.swift
//  TrafficLightsSwiftUI
//
//  Created by Леся on 28.07.2021.
//

import SwiftUI

struct ColorSignal: View {
    var color: TrafficLightColor = .red
    var state: TrafficLightState = .off
    var lineWidth: CGFloat = 2
    
    private let circleSize: CGFloat = 95
    
    var body: some View {
        switch color {
        case .red:
            signalCircle(color: .red, opacity: state.rawValue, circleSize: circleSize)
        case .yellow:
            signalCircle(color: .yellow, opacity: state.rawValue, circleSize: circleSize)
        case .green:
            signalCircle(color: .green, opacity: state.rawValue, circleSize: circleSize)
        }
    }
    
    private func signalCircle(color: Color, opacity: Double, circleSize: CGFloat) -> some View {
        
        Circle()
            .stroke(color.opacity(0.2), lineWidth: lineWidth)
            .background(
                Circle().fill(RadialGradient(gradient: Gradient(colors: [.white, color]), center: .center, startRadius: 2, endRadius: 100))
                    .opacity(opacity))
            .frame(width: circleSize, height: circleSize)
            .shadow(color: color, radius: 36)
            .padding(.bottom, 24)
    }
}

struct Signal_Previews: PreviewProvider {
    static var previews: some View {
        ColorSignal().previewLayout(.sizeThatFits)
    }
}

