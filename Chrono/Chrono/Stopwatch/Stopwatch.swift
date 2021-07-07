//
//  Stopwatch.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct Stopwatch: View {
    @ObservedObject var stopwatch = StopwatchManager()

    var body: some View {
        VStack {
            ForEach(stopwatch.laps, id: \.self) { x in
                HStack {
                    Text(x.runningTime.toTime())
                    Text(x.totalTime.toTime())
                }
            }

            Text("\(stopwatch.totalTime.toTime())")

            Button(action: { stopwatch.start() }, label: {
                Text("Start")
                    .padding()
            })

            Button(action: { stopwatch.pause() }, label: {
                Text("Stop")
                    .padding()

            })

            Button(action: {
                withAnimation {
                    stopwatch.lap()
                }
            }, label: {
                Text("Lap")
                    .padding()

            })

            Button(action: { stopwatch.start() }, label: {
                Text("Resume")
                    .padding()

            })

            Button(action: { stopwatch.reset() }, label: {
                Text("Reset")
                    .padding()

            })
        }
    }
}

struct Stopwatch_Previews: PreviewProvider {
    static var previews: some View {
        Stopwatch()
    }
}

extension Double {
    func toTime(
        pad: Bool = true,
        units: NSCalendar.Unit = [NSCalendar.Unit.nanosecond, NSCalendar.Unit.second, NSCalendar.Unit.minute, NSCalendar.Unit.hour]
    ) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.includesApproximationPhrase = false
        formatter.includesTimeRemainingPhrase = false

        if pad { formatter.zeroFormattingBehavior = .pad }
        formatter.allowedUnits = units
        return formatter.string(from: self) ?? ""
    }
}

extension TimeInterval {
    func toTime() -> String {
        let miliseconds = Int((self * 1000).truncatingRemainder(dividingBy: 1000)) / 10
        let seconds = Int(truncatingRemainder(dividingBy: 60))
        let minutes = Int(truncatingRemainder(dividingBy: 60 * 60) / 60)
        let hours = Int(self / 3600)

        if hours > 0 {
            return String(format: "%d:%.2d:%.2d:%.2d", hours, minutes, seconds, miliseconds)
        } else {
            return String(format: "%.2d:%.2d:%.2d", minutes, seconds, miliseconds)
        }
    }
}
