//
//  Circuit Row.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct Circuit_Row: View {
    @State var circuitName = "Push ups"
    @State var sets = 5
    @State var restTime = 50
    @State var workTime = 25
    @State var workoutImg = "ic_abs"

    var body: some View {
        HStack {
            Image(workoutImg)
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .padding()

            VStack {
                HStack {
                    Text("\(circuitName)")
                        .bold()
                        .font(.body)

                    Spacer()

                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 10, height: 15, alignment: .center)
                }
                .padding(.trailing)

                Text("\(sets) Sets")
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    RestBottomLabel(restTime: 50)
                        .padding(.trailing)
                    WorkBottomLabel()
                    Spacer()
                }
                .padding(.top)
            }
        }
        .background(Color("Plum"))
        .cornerRadius(20, antialiased: true)
        .shadow(color: .black, radius: 3, x: 0, y: 3)
    }
}

private struct RestBottomLabel: View {
    @State var restTime = 25
    var label = "Rest"
    var img = Image("timer_black")
    var body: some View {
        HStack {
            BottomLabel(value: restTime, name: label, img: img)
        }
    }
}

private struct WorkBottomLabel: View {
    @State var workTime = 25
    var label = "Work"
    var img = Image(systemName: "clock")
    var body: some View {
        HStack {
            BottomLabel(value: workTime, name: label, img: img)
        }
    }
}

private struct BottomLabel: View {
    @State var value = 10
    @State var name = "Work"
    @State var img = Image(systemName: "line.horizontal.3")
    var body: some View {
        HStack {
            img
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
            Text("\(name): \(value)s")
        }
    }
}

struct Circuit_Row_Previews: PreviewProvider {
    static var previews: some View {
        Circuit_Row()
            .preferredColorScheme(.dark)
    }
}
