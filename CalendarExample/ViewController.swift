//
//  ViewController.swift
//  CalendarExample
//
//  Created by Dan, Radu-Ionut (RO - Bucharest) on 11/06/2019.
//  Copyright © 2019 radude89. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!

    private let currentCalendar = Calendar.current
    private var autoupdatingCalendar = Calendar.autoupdatingCurrent

    @IBAction func onTouchCalendarCurrent(_ sender: Any) {
        displayCalendarInfo(from: currentCalendar)
    }

    @IBAction func onTouchCalendarAutoupdatingCurrent(_ sender: Any) {
        displayCalendarInfo(from: autoupdatingCalendar)
    }

    private func displayCalendarInfo(from calendar: Calendar) {
        let comps = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())

        // minor output formatting
        let time: (hour: Int, minute: Int) = (comps.hour!, comps.minute!)
        let hours = time.hour < 10 ? "0\(time.hour)" : "\(time.hour)"
        let minutes = time.minute < 10 ? "0\(time.minute)" : "\(time.minute)"

        var output = "Calendar: \(calendar.identifier)\nTime Zone: \(calendar.timeZone.identifier)\n"
        output.append(contentsOf: "\(hours):\(minutes)")

        outputLabel.text = output
    }

}
