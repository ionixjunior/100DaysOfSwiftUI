//
//  Converter.swift
//  TimeConversion
//
//  Created by Ione Souza Junior on 19/07/24.
//

import Foundation

class Converter {
    private init() {}

    static func convert(value: Int, from: Unit, to: Unit) -> Int {
        if (from == .seconds || from == .minutes) && (to == .seconds || to == .minutes) {
            return convertBetweenSecondsAndMinutes(value: value, from: from, to: to)
        }

        if (from == .seconds || from == .hours) && (to == .seconds || to == .hours) {
            return convertBetweenSecondsAndHours(value: value, from: from, to: to)
        }

        if (from == .seconds || from == .days) && (to == .seconds || to == .days) {
            return convertBetweenSecondsAndDays(value: value, from: from, to: to)
        }

        if (from == .minutes || from == .hours) && (to == .minutes || to == .hours) {
            return convertBetweenMinutesAndHours(value: value, from: from, to: to)
        }

        return 0
    }

    private static func convertBetweenSecondsAndMinutes(value: Int, from: Unit, to: Unit) -> Int {
        if from == .seconds {
            return value / 60
        }

        return value * 60
    }

    private static func convertBetweenSecondsAndHours(value: Int, from: Unit, to: Unit) -> Int {
        if from == .seconds {
            return value / 60 / 60
        }

        return value * 60 * 60
    }

    private static func convertBetweenSecondsAndDays(value: Int, from: Unit, to: Unit) -> Int {
        if from == .seconds {
            return value / 60 / 60 / 24
        }

        return value * 60 * 60 * 24
    }

    private static func convertBetweenMinutesAndHours(value: Int, from: Unit, to: Unit) -> Int {
        if from == .minutes {
            return value / 60
        }

        return value * 60
    }
}

