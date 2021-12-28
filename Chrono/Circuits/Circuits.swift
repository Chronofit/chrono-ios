//
//  Circuits.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct Circuits: View {
    var body: some View {
        VStack {
            Circuit_Empty_Page()
            Circuit_Row()
            Spacer()
        }
    }
}

struct Circuits_Previews: PreviewProvider {
    static var previews: some View {
        Circuits()
    }
}
