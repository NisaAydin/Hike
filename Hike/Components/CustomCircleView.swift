//
//  CustomCircleView.swift
//  Hike
//
//  Created by Nisa Aydin on 29.03.2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.colorIndigoMedium,.colorSalmonLight], startPoint: isAnimateGradient ? .topLeading : . bottomLeading, endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                    // İki renkten oluşturmak için Lineer Gradient
                
                )
                .onAppear(){
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                        
                    }
                   
                }
            MotionAnimationView()
            .frame(width: 256, height: 256, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    CustomCircleView()
}
