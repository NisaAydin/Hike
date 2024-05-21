//
//  CustomButtonView.swift
//  Hike
//
//  Created by Nisa Aydin on 28.03.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(LinearGradient(colors: [.white,.colorGreenLight,.colorGreenMedium], startPoint: .top, endPoint: .bottom))
            Circle()
                .stroke(LinearGradient(colors: [.colorGrayLight,.colorGrayMedium], startPoint: .top, endPoint: .bottom),lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 20))
                .foregroundStyle(LinearGradient(colors: [.colorGrayLight,.colorGrayMedium], startPoint: .top, endPoint: .bottom))
        }.frame(width: 40,height: 40)
        
    }
        
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits) //   Xcode'un canvas'ında bir bileşenin (component) önizlemesini yaparken kullanılır önizlemeyi bileşenin içeriğine göre en uygun boyuta sığacak şekilde ayarlar.
        .padding()
}
