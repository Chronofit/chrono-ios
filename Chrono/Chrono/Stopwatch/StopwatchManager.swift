//
//  StopwatchManager.swift
//  Chrono
//
//  Created by Hari Govind on 2021-07-20.
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

    @Published var isIdle: Bool = true
    @Published var isRunning: Bool = false
    @Published var isPaused: Bool = false

    private var currentLap = 0.0
    private var stopwatch: Timer?

    var backgroundTime: Date?
    var backgroundForgroundTimelaps: Double?

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
        isIdle = false
        isRunning = true
        isPaused = false
    }

    func pause() {
        guard isRunning else { return }
        stopwatch!.invalidate()
        isIdle = false
        isRunning = false
        isPaused = true
    }

    func reset() {
        guard !isRunning else { return }
        stopwatch!.invalidate()
        totalTime = 0.0
        currentLap = 0.0
        laps = []
        isIdle = true
        isRunning = false
        isPaused = false
    }

    func lap() {
        guard isRunning else { return }
        let tempLap = Lap(runningTime: currentLap, totalTime: totalTime)
        currentLap = 0
        laps.append(tempLap)
    }

    @objc fileprivate func didEnterBackgroundNotification() {
        print("Backgrounded")
        backgroundForgroundTimelaps = nil
        backgroundTime = Date()
    }

    @objc fileprivate func willEnterForegroundNotification() {
        print("Foreground")
        backgroundForgroundTimelaps = Date().timeIntervalSince(backgroundTime ?? Date())
        backgroundTime = nil
        totalTime += backgroundForgroundTimelaps ?? 0
        currentLap += backgroundForgroundTimelaps ?? 0
    }
}
