//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Nisa Aydin on 29.03.2024.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating : Bool = false
    
    // MARK: - Functions
    // MARK: - 1.) Random coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // MARK: - 2.) Random size
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    // MARK: - 3.) Random scale
    
    func randomScale() -> CGFloat {
            return CGFloat.random(in: 0.1...2.0)
        }
        
    
    // MARK: - 4.) Random speed
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // MARK: - 5.) Random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
        
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .position(CGPoint(x: randomCoordinate(), y: randomCoordinate()))
                    .frame(width: randomSize(),height: randomSize())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                   
            }
            .onAppear(perform: {
                // ForEach döngüsüne bağlı tüm Circle görünümleri ekranda görünür olduğunda tetiklenir.
                withAnimation(
                    .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                    // stiffnes: sıklık , damping: sönümleme
                    .repeatForever()
                    .speed(randomSpeed())
                    // speed animationa özgü özellik
                        .delay(randomDelay())
                
                ){
                    isAnimating = true
                }
                
            }

            )
                
        }.frame(width: 256,height: 256)
            .mask(Circle())
        // Daireye göre kırpar.
            .drawingGroup()
        
    }
}

#Preview {
   MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
    
}
