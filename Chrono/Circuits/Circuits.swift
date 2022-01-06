//
//  Circuits.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct Circuits: View {
    let circuit1 = CircuitObject(circuitName: "eating", sets: 5, restTime: 50, workTime: 25, workoutImg: "ic_abs")
    let circuit2 = CircuitObject(circuitName: "running", sets: 5, restTime: 50, workTime: 25, workoutImg: "ic_arm")

    var body: some View {
        let tempList: [CircuitObject] = [circuit1, circuit2]
        VStack(spacing: 10) {
            Circuit_Empty_Page()
            ForEach(0 ... 1, id: \.self) {
                Circuit_Row(circuitName: tempList[$0].circuitName, sets: tempList[$0].sets, restTime: tempList[$0].restTime, workTime: tempList[$0].workTime, workoutImg: tempList[$0].workoutImg)
            }

            Spacer()
        }
    }
}

struct Circuits_Previews: PreviewProvider {
    static var previews: some View {
        Circuits()
    }
}
