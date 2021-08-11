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
                .font(.system(size: 40, weight: .heavy, design: .default))
                .padding()

            Spacer()
            ScrollViewReader { scrollView in
                ScrollView(.vertical) {
                    ForEach(stopwatch.laps.indices, id: \.self) { index in
                        LazyHStack {
                            Text(String(index + 1))
                            Text(stopwatch.laps[index].runningTime.toTime())
                                .font(.monospacedDigit(.system(size: 20))())
                            Text(stopwatch.laps[index].totalTime.toTime())
                                .font(.monospacedDigit(.system(size: 20))())
                        }
                        .frame(maxWidth: .infinity)
                        .animation(.default)
                        .onAppear {
                            scrollView.scrollTo(stopwatch.laps.endIndex - 1)
                        }
                    }
                }
            }

//            ScrollView{
//                ForEach(stopwatch.laps.indices, id: \.self) { index in
//                HStack {
//                    Text(String(index+1))
//                    Text(stopwatch.laps[index].runningTime.toTime())
//                        .font(.monospacedDigit(.system(size:20))())
//                    Text(stopwatch.laps[index].totalTime.toTime())
//                        .font(.monospacedDigit(.system(size:20))())
//                }
//                .frame(maxWidth: .infinity)
//            }
//                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
//
//            }

            Text("\(stopwatch.totalTime.toTime())")
                .font(.monospacedDigit(.system(size: 70))())

            // Buttons for idle state
            if stopwatch.isIdle {
                Button(action: { stopwatch.start() }, label: {
                    Text(Strings.start)
                        .padding()
                        .frame(width: 125, height: 50)
                })
                    .foregroundColor(.white)
                    .background(Color("resume_green"))
                    .cornerRadius(13.0)
                    .padding()
            }

            // Buttons for running state
            if stopwatch.isRunning {
                HStack {
                    Button(action: { stopwatch.pause() }, label: {
                        Text(Strings.stop)
                            .padding()
                            .frame(width: 125, height: 50)
                    })
                        .foregroundColor(.white)
                        .background(Color("stop_red"))
                        .cornerRadius(13.0)
                        .padding()

                    Button(action: {
                        withAnimation {
                            stopwatch.lap()
                        }
                    }, label: {
                        Text(Strings.lap)
                            .padding()
                            .frame(width: 125, height: 50)
                    })
                        .foregroundColor(.white)
                        .background(Color("lap_blue"))
                        .cornerRadius(13.0)
                        .padding()
                }
            }

            // Buttons for paused state
            if stopwatch.isPaused {
                HStack {
                    Button(action: { stopwatch.start() }, label: {
                        Text(Strings.resume)
                            .padding()
                            .frame(width: 125, height: 50)
                    })
                        .foregroundColor(.white)
                        .background(Color("resume_green"))
                        .cornerRadius(13.0)
                        .padding()

                    Button(action: { stopwatch.reset() }, label: {
                        Text(Strings.reset)
                            .padding()
                            .frame(width: 125, height: 50)
                    })
                        .foregroundColor(.white)
                        .background(Color("reset_grey"))
                        .cornerRadius(13.0)
                        .padding()
                }
            }
        }.frame(maxHeight: .infinity)
//        .navigationBarTitle("Stopwatch")
            .navigationBarHidden(true)
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
