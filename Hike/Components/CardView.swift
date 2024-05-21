//
//  CardView.swift
//  Hike
//
//  Created by Nisa Aydin on 28.03.2024.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Propetries
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - Function
    
    func randomImage() {
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                VStack{
                    HStack{
                        
                    
                    Text("Hikingg").fontWeight(.black)
                        .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [.colorGrayLight,.colorGrayMedium], startPoint: .top, endPoint: .bottom))
                        .padding(.trailing)
                        
                        Button(action: {
                            isShowingSheet.toggle()
                            
                        }, label: {
                            CustomButtonView()
                        })
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDetents([.medium,.large])
                            // medium: yarısı large tümünü kaplar ekranın
                                .presentationDragIndicator(.visible)
                            // Sürükleme işareti
                        }
                  
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                        
               
                }.padding(.horizontal,30)
                // Yatayda 30 ar boşluk bırak
                ZStack {
                  CustomCircleView()
                        .frame(width: 256, height: 256, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Image("image-\(randomNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                    // imageNumberın geğişimine bağlı olarak animasyonu tetikler.
                }
                Button(action: {
                    // Generate a random rumber
                    randomImage()
            
                    
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.25, x: 1, y: 3)
                    
                })
                .buttonStyle(GradientButtonStyle())
             
            }

        } // CARD
        .frame(width: 320, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CardView()
}
