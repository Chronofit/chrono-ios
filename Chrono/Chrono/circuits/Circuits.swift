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
            CircuitRow()
            Spacer()
        }
    }
}

struct CircuitsPreviews: PreviewProvider {
    static var previews: some View {
        Circuits()
    }
}