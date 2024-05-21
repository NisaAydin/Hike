//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Nisa Aydin on 28.03.2024.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                configuration.isPressed ?
                LinearGradient(gradient: Gradient(colors: [.colorGrayMedium, .colorGrayLight]), startPoint: .top, endPoint: .bottom)
                :
                    LinearGradient(gradient: Gradient(colors: [.colorGrayLight, .colorGrayMedium]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}





