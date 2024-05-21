//
//  SettingsView.swift
//  Hike
//
//  Created by Nisa Aydin on 29.03.2024.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    
    
    ]
    
    var body: some View {
        
            List{
                Section{
                HStack{
                    Spacer()
       
                Image(systemName: "laurel.leading")
                    .font(.system(size: 66,weight: .black))
                    VStack(spacing: -10){
                        Text("Hike")
                            .font(.system(size: 80,weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
              
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 66,weight: .black))
                    Spacer()
                }.foregroundStyle(LinearGradient(colors: [
                    .colorGreenLight,.colorGreenMedium,.colorGreenDark
                ], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                    VStack(spacing: 8){
       
                Text("Where can you find perfect tracks?")
                    .font(.title2).fontWeight(.heavy)

                Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. Find the best day hikes in the app.")
                    .font(.footnote)
                    .italic()
                        
                        Text("Dust off the boots! It's time for a walk.")
                            .fontWeight(.heavy)
                            .foregroundColor(.colorGreenMedium)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.bottom,16)
                    .frame(maxWidth: .infinity)
                   // bu modifiyer kullanıldığında, görünüm ebeveyninin sağladığı maksimum genişliği kullanır ve bu alana sığmaya çalışır.
                }

                .listRowSeparator(.hidden, edges: .bottom)
                Section( header: Text("ALTERNATE ICONS")){
                    ScrollView(.horizontal,showsIndicators: false){
                        // showsIndicators Kaydırma sırasında kaydırma çubuklarının (scroll bars) veya göstergelerin gösterilmemesini sağlar.
                        HStack(spacing: 12) {
                            ForEach(alternateAppIcons.indices,id: \.self) { item in
                                // id ForEach döngüsünde her bir elemanın kendine özgü bir kimlikle tanımlanmasını sağlar.
                                Button{
                                    print("Icon \(alternateAppIcons[item]) was pressed.")
                                    UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                        if error != nil {
                                            print("Failed request to update the app's icon.\(String(describing: error?.localizedDescription))")
                                            // General AppIconSource check
                                        }else{
                                            print("Seccesfull")
                                        }
                                        
                                    }
                                    
                                } label:{
                                    Image("\(alternateAppIcons[item])-Preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 80)
                                        .cornerRadius(16)
                                    
                                    
                                }
                            .buttonStyle(.borderless)
                            }
                        } // metin tabanlı linkler veya ikon butonlar için kullanılabilir.
                    }
                    .padding(.top,20)
                    Text("Choose your favorite app icon from the collection above.")
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary) // Dipnot için kullanılır.
                        .font(.footnote)
                        .padding(.bottom,12)
                    
                    
                    
                }
                .listRowSeparator(.hidden)
                Section(
                    header: Text("ABOUT THE APP"),
                    footer: HStack{
                        Spacer()
                        Text("Copyright ® All right reserved.")
                        Spacer()
                    }
                        .padding(.vertical,8)
                ){
                    //LabeledContent("Application", value: "Hike")
                    // Labeled content soldaki etiket
                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintcolor: .blue)
                    
                    CustomListRowView(rowLabel: "Comatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintcolor: .red)
                    
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintcolor: .orange)
                    
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintcolor: .purple)
                    
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintcolor: .teal)
                    
                    CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintcolor: .pink)
                    
                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintcolor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
                    
                    
                }
            }
     
        
        
    }
}

#Preview {
    SettingsView()
}
