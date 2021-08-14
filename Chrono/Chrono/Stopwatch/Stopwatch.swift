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
            Text(Strings.stopwatch)
                .padding()
                .font(.system(size: 40, weight: .semibold, design: .default))

            Spacer()
            ScrollViewReader { scrollView in
                ScrollView(.vertical) {
                    ForEach(stopwatch.laps.indices, id: \.self) { index in
                        LapItem(lapNumber: index + 1, runningTime: stopwatch.laps[index].runningTime.toTime(), totalTime: stopwatch.laps[index].totalTime.toTime())
                            .onAppear {
                                withAnimation(.linear) {
                                    scrollView.scrollTo(stopwatch.laps.endIndex - 1)
                                }
                            }
                    }
                }
            }

            Text("\(stopwatch.totalTime.toTime())")
                .font(.monospacedDigit(.system(size: 70))())

            // Buttons for idle state
            if stopwatch.isIdle {
                IdleStopwatchControl(stopwatch: stopwatch)
            }

            // Buttons for running state
            if stopwatch.isRunning {
                RunningStopwatchControl(stopwatch: stopwatch)
            }

            // Buttons for paused state
            if stopwatch.isPaused {
                PausedStopwatchControl(stopwatch: stopwatch)
            }
        }
        .frame(maxHeight: .infinity)
        .navigationBarHidden(true)
    }
}

struct LapItem: View {
    var lapNumber: Int
    var runningTime: String
    var totalTime: String

    var body: some View {
        LazyHStack {
            Text(String(lapNumber))
            Text(runningTime)
                .font(.monospacedDigit(.system(size: 20))())
            Text(totalTime)
                .font(.monospacedDigit(.system(size: 20))())
        }
        .frame(maxWidth: .infinity)
    }
}

struct IdleStopwatchControl: View {
    var stopwatch: StopwatchManager
    var body: some View {
        Button(action: { stopwatch.start() }, label: {
            Text(Strings.start)
                .stopwatchBtnLabelStyle()
        })
            .stopwatchBtnStyle(with: "resume_green")
    }
}

struct RunningStopwatchControl: View {
    var stopwatch: StopwatchManager
    var body: some View {
        HStack {
            Button(action: { stopwatch.pause() }, label: {
                Text(Strings.stop)
                    .stopwatchBtnLabelStyle()
            })
                .stopwatchBtnStyle(with: "stop_red")

            Button(action: {
                withAnimation(.spring()) {
                    stopwatch.lap()
                }
            }, label: {
                Text(Strings.lap)
                    .stopwatchBtnLabelStyle()
            })
                .stopwatchBtnStyle(with: "lap_blue")
        }
    }
}

struct PausedStopwatchControl: View {
    var stopwatch: StopwatchManager

    var body: some View {
        HStack {
            Button(action: { stopwatch.start() }, label: {
                Text(Strings.resume)
                    .stopwatchBtnLabelStyle()
            })
                .stopwatchBtnStyle(with: "resume_green")

            Button(action: { stopwatch.reset() }, label: {
                Text(Strings.reset)
                    .stopwatchBtnLabelStyle()
            })
                .stopwatchBtnStyle(with: "reset_grey")
        }
    }
}

struct StopwatchBtnLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 125, height: 50, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
    }
}

extension Text {
    func stopwatchBtnLabelStyle() -> some View {
        modifier(StopwatchBtnLabelModifier())
    }
}

struct StopwatchBtnModifier: ViewModifier {
    var customBackgroundColor: String
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(Color(customBackgroundColor))
            .cornerRadius(13.0)
            .padding()
    }
}

extension Button {
    func stopwatchBtnStyle(with backgroundColor: String) -> some View {
        modifier(StopwatchBtnModifier(customBackgroundColor: backgroundColor))
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
            return String(format: "%d:%.2d:%.2d.%.2d", hours, minutes, seconds, miliseconds)
        } else {
            return String(format: "%.2d:%.2d.%.2d", minutes, seconds, miliseconds)
        }
    }
}
