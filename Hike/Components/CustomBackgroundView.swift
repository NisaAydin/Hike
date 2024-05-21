//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Nisa Aydin on 28.03.2024.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        
        ZStack {
            // MARK: - 3.DEPTH
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y:12)
            //  Pozitif değerler görünümü aşağı doğru ittirirken, negatif değerler yukarı doğru ittirir.
            
            // MARK: - 2.LIGHT
            Color.colorGreenLight            
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.8)
            
            
            // MARK: - 1.SURFACE
            
            LinearGradient(colors: [.colorGreenLight,.colorGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView().padding()
}
