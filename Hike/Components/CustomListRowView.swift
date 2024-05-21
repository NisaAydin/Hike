//
//  CustomListRowView.swift
//  Hike
//
//  Created by Nisa Aydin on 29.03.2024.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: -  Properties
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintcolor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    var body: some View {

            LabeledContent{
                if rowContent != nil {
                    Text(rowContent!)
                        .foregroundColor(.primary)
                    .fontWeight(.heavy)
                } else if(rowLinkLabel != nil && rowLinkDestination != nil){
                    Link(rowLinkLabel!,destination: URL(string: rowLinkDestination!)!)
                        .foregroundColor(.pink)
                        .fontWeight(.heavy)
                    // Link görünümü, kullanıcıya tıklanabilir bir metin sağlar ve sağlanan URL'ye yönlendirir. Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!) ifadesi, kullanıcının tıklaması halinde rowLinkDestination adresine yönlendirilmesini sağlar.
                    
                }
                
                else {
                    EmptyView()
                }
                
            } label: {
                HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 30,height: 30)
                            .foregroundColor(rowTintcolor)
                        Image(systemName: rowIcon)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    Text(rowLabel)
                }
            }
        
       
    }
}

#Preview {
    List(0 ..< 1) { item in
        CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintcolor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
        
    }
}
