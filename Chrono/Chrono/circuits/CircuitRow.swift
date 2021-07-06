//
//  Circuit Row.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct CircuitRow: View {
    @State var sets = 5
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .padding()
            VStack {
                HStack {
                    Text("Jump Rope Warmup")
                        .bold()
                        .font(.body)
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 10, height: 15, alignment: .center)
                }
                Leading {
                    Text("\(sets) Sets")
                }
                HStack {
                    BottomLabel(restTime: 50)
                        .padding(.trailing)
                    BottomLabel()
                    Spacer()
                }
                .padding(.top)
            }
        }
        .padding()
    }
}

private struct BottomLabel: View {
    @State var restTime = 10
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .frame(width: 10, height: 15, alignment: .center)
            Text("Rest: \(restTime)s")
        }
    }
}


struct CircuitRowPreviews: PreviewProvider {
    static var previews: some View {
        CircuitRow()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
