//
//  Stopwatch Manager.swift
//  Chrono
//
//  Created by Sagar on 2021-06-25.
//

import Foundation
import SwiftUI

struct Lap: Hashable {
    let runningTime: Double
    let totalTime: Double
}

class StopwatchManager: ObservableObject {
    @Published var totalTime = 0.0
    @Published var laps: [Lap] = []

    private var currentLap = 0.0
    private var isRunning = false
    private var stopwatch: Timer?

    var backgroundTime: Date?
    var background_forground_timelaps: Double?

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    func start() {
        guard !isRunning else { return }
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackgroundNotification), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForegroundNotification), name: UIApplication.willEnterForegroundNotification, object: nil)

        stopwatch = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.totalTime += 0.01
            self.currentLap += 0.01
            self.isRunning = true
        }
    }

    func pause() {
        guard isRunning else { return }
        stopwatch!.invalidate()
        isRunning = false
    }

    func reset() {
        guard !isRunning else { return }
        stopwatch!.invalidate()
        totalTime = 0.0
        currentLap = 0.0
        laps = []
        isRunning = false
    }

    func lap() {
        guard isRunning else { return }
        let tempLap = Lap(runningTime: currentLap, totalTime: totalTime)
        currentLap = 0
        laps.append(tempLap)
    }

    @objc fileprivate func didEnterBackgroundNotification() {
        print("Backgrounded")
        background_forground_timelaps = nil
        backgroundTime = Date()
    }

    @objc fileprivate func willEnterForegroundNotification() {
        print("Foreground")
        background_forground_timelaps = Date().timeIntervalSince(backgroundTime ?? Date())
        backgroundTime = nil
        totalTime += background_forground_timelaps ?? 0
        currentLap += background_forground_timelaps ?? 0
    }
}
