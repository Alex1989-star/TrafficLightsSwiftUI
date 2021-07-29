//
//  Signal.swift
//  TrafficLightsSwiftUI
//
//  Created by Леся on 29.07.2021.
//

import SwiftUI

struct Signal: View {
    
    var color: Color = .red
    var opacity: Double = 1
    
    var body: some View {
        Circle()
            .stroke(color.opacity(0.2), lineWidth: 1)
            .background(
                Circle().fill(RadialGradient(gradient: Gradient(colors: [.white, color]), center: .center, startRadius: 2, endRadius: 100))
                    .opacity(opacity))
            .frame(width: 95, height: 95)
            .shadow(color: color, radius: 36)
            .padding(.bottom, 24)
    }
}

struct SwiftUIView_Signal_Previews: PreviewProvider {
    static var previews: some View {
        Signal()
    }
}
