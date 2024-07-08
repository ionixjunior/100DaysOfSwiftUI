import UIKit

enum CalculateError: Error {
    case outOfBounds
    case noRoot
}

func calculateSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw CalculateError.outOfBounds
    }

    var squareRoot: Int?
    var numberToMultiply = 1
    while numberToMultiply <= 100 {
        if numberToMultiply * numberToMultiply == number {
            squareRoot = numberToMultiply
            numberToMultiply = 100
        }

        numberToMultiply += 1
    }

    guard let squareRoot = squareRoot else { throw CalculateError.noRoot }
    return squareRoot
}

do {
    let number = 25
    let squareRoot = try calculateSquareRoot(of: number)
    print("The square root of \(number) is \(squareRoot)")
} catch CalculateError.outOfBounds {
    print("out of bounds")
} catch CalculateError.noRoot {
    print("no root")
} catch {
    print("Generic error: \(error.localizedDescription)")
}

