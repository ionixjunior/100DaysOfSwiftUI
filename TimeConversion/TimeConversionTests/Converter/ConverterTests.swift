//
//  ConverterTests.swift
//  TimeConversionTests
//
//  Created by Ione Souza Junior on 19/07/24.
//

import XCTest
@testable import TimeConversion

final class ConverterTests: XCTestCase {
    func testConverterSecondsToMinutes() {
        let value = 86400
        let from = Unit.seconds
        let to = Unit.minutes

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(1440, result)
    }

    func testConverterSecondsToHours() {
        let value = 86400
        let from = Unit.seconds
        let to = Unit.hours

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(24, result)
    }

    func testConverterSecondsToDays() {
        let value = 86400
        let from = Unit.seconds
        let to = Unit.days

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(1, result)
    }

    func testConverterMinutesToSeconds() {
        let value = 1440
        let from = Unit.minutes
        let to = Unit.seconds

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(86400, result)
    }

    func testConverterMinutesToHours() {
        let value = 1440
        let from = Unit.minutes
        let to = Unit.hours

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(24, result)
    }

    func testConvertMinutesToDays() {
        let value = 1440
        let from = Unit.minutes
        let to = Unit.days

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(1, result)
    }

    func testConvertHoursToSeconds() {
        let value = 24
        let from = Unit.hours
        let to = Unit.seconds

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(86400, result)
    }

    func testConvertHoursToMinutes() {
        let value = 24
        let from = Unit.hours
        let to = Unit.minutes

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(1440, result)
    }

    func testConvertHoursToDays() {
        let value = 24
        let from = Unit.hours
        let to = Unit.days

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(1, result)
    }

    func testConvertDaysToSeconds() {
        let value = 1
        let from = Unit.days
        let to = Unit.seconds

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(86400, result)
    }

    func testConvertDaysToMinutes() {
        let value = 1
        let from = Unit.days
        let to = Unit.minutes

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(1440, result)
    }

    func testConvertDaysToHours() {
        let value = 1
        let from = Unit.days
        let to = Unit.hours

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(24, result)
    }

    func testConvertTheSameUnit() {
        let value = 1
        let from = Unit.days
        let to = Unit.days

        let result = Converter.convert(value: value, from: from, to: to)

        XCTAssertEqual(value, result)
    }
}
