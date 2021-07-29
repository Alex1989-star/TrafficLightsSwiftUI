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
            Signal(color: .red, opacity: state.rawValue)
        case .yellow:
            Signal(color: .yellow, opacity: state.rawValue)
        case .green:
            Signal(color: .green, opacity: state.rawValue)
        }
    }
}

struct Signal_Previews: PreviewProvider {
    static var previews: some View {
        ColorSignal().previewLayout(.sizeThatFits)
    }
}

