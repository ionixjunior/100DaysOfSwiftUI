//
//  Converter.swift
//  TimeConversion
//
//  Created by Ione Souza Junior on 19/07/24.
//

import Foundation

class Converter {
    private init() {}

    static func convert(value: Double, from: Unit, to: Unit) -> Double {
        if from == to {
            return value
        }

        var valueToConvert = value
        var fromUnitToConvert = from
        var toUnitToConvert = to

        if from == .days {
            valueToConvert *= 24
            fromUnitToConvert = .hours
        } else if to == .days {
            valueToConvert /= 24
            toUnitToConvert = .hours
        }

        guard let fromUnitDuration = convertToUnitDuration(fromUnitToConvert) else { return 0.0 }
        guard let toUnitDuration = convertToUnitDuration(toUnitToConvert) else { return 0.0 }

        let measurement = Measurement(value: valueToConvert, unit: fromUnitDuration)
        return measurement.converted(to: toUnitDuration).value
    }

    private static func convertToUnitDuration(_ unit: Unit) -> UnitDuration? {
        switch unit {
        case .seconds:
            return .seconds
        case .minutes:
            return .minutes
        case .hours:
            return .hours
        default:
            return nil
        }
    }
}

