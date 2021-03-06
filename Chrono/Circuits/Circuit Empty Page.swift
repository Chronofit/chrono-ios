//
//  Circuit Empty Page.swift
//  Chrono
//
//  Created by Hari Govind on 2021-12-25.
//

import SwiftUI

struct Circuit_Empty_Page: View {
    var body: some View {
        HStack {
            Image(systemName: "plus.circle")
                .foregroundColor(Color("Mustard"))
                .font(.largeTitle)
                .padding()

            Text("Create a Circuit")
            Spacer()
        }
        .padding()
        .background(Color("Plum"))
        .cornerRadius(20, antialiased: true)
        .frame(maxWidth: .infinity)
        .shadow(color: .black, radius: 3, x: 0, y: 3)
    }
}

struct Circuit_Empty_Page_Previews: PreviewProvider {
    static var previews: some View {
        Circuit_Empty_Page()
            .preferredColorScheme(.dark)
    }
}
