//
//  Circuit Empty Page.swift
//  Chrono
//
//  Created by Hari Govind on 2021-12-25.
//

import SwiftUI

struct Circuit_Empty_Page: View{
    
    var body: some View{
        HStack{
            
            Image(systemName: "plus.circle")
                .foregroundColor(Color("Mustard"))
                .font(.largeTitle)
                .padding()
            
            Text("Create a Circuit")
        }
        .padding()
        .background(Color("Plum"))
        .cornerRadius(20, antialiased: true)
    }
}

struct Circuit_Empty_Page_Previews: PreviewProvider{
    static var previews: some View{
        Circuit_Empty_Page()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
